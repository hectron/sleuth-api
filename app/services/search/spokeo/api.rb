# frozen_string_literal: true

module Search
  module Spokeo
    class Api
      STATE_USPS_ABBREVIATION_TO_NAME = {
        AL: "Alabama",
        AK: "Alaska",
        AZ: "Arizona",
        AR: "Arkansas",
        CA: "California",
        CO: "Colorado",
        CT: "Connecticut",
        DE: "Delaware",
        FL: "Florida",
        GA: "Georgia",
        HI: "Hawaii",
        ID: "Idaho",
        IL: "Illinois",
        IN: "Indiana",
        IA: "Iowa",
        KS: "Kansas",
        KY: "Kentucky",
        LA: "Louisiana",
        ME: "Maine",
        MD: "Maryland",
        MA: "Massachusetts",
        MI: "Michigan",
        MN: "Minnesota",
        MS: "Mississippi",
        MO: "Missouri",
        MT: "Montana",
        NE: "Nebraska",
        NV: "Nevada",
        NH: "New Hampshire",
        NJ: "New Jersey",
        NM: "New Mexico",
        NY: "New York",
        NC: "North Carolina",
        ND: "North Dakota",
        OH: "Ohio",
        OK: "Oklahoma",
        OR: "Oregon",
        PA: "Pennsylvania",
        RI: "Rhode Island",
        SC: "South Carolina",
        SD: "South Dakota",
        TN: "Tennessee",
        TX: "Texas",
        UT: "Utah",
        VT: "Vermont",
        VA: "Virginia",
        WA: "Washington",
        WV: "West Virginia",
        WI: "Wisconsin",
        WY: "Wyoming",
      }.freeze

      def self.run(user)
        state = STATE_USPS_ABBREVIATION_TO_NAME[user.state.upcase.to_sym]
        new(name: user.name, state:).run
      end

      def initialize(name:, state:, http_client: Faraday)
        @name = name
        @state = state
        @http_client = http_client
      end

      def run
        response = @http_client.get("https://www.spokeo.com/#{to_param(@name)}/#{to_param(@state)}")

        raise "Unable to request user. Status: #{response.status}" if response.status != 200

        Spokeo::Parser.parse(response.body)
      end

      def to_param(value)
        value.downcase.split(" ").map(&:capitalize).join("-")
      end
    end
  end
end
