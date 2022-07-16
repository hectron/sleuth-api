# frozen_string_literal: true

# A module for parsing an HTML page using Nokogiri
module Search
  module Spokeo
    class Parser
      ScriptCssClass = '[data-testid="people-json-ld"]'

      def self.parse(html)
        new(html).parse
      end

      def initialize(html)
        @html = html
      end

      # rubocop:disable Metrics/AbcSize
      def parse
        html_node = Nokogiri::HTML(@html)
        results = JSON.parse(html_node.at_css(ScriptCssClass).text)

        results.each_with_object([]) do |listing, output|
          result = {}
          result[:name] = listing["name"]
          result[:alternative_names] = listing["additionalName"]
          result[:url] = listing["url"]
          # each relatedTo also has a URL, which would be neat to enable a "unsubscribe" family functionality
          result[:related_to] = listing["relatedTo"].map { |person| person["name"] }
          result[:known_addresses] = listing["homeLocation"].map do |place|
            {
              city: place.dig("address", "addressLocality"),
              state: place.dig("address", "addressRegion"),
              zip: place.dig("address", "postalCode"),
            }
          end

          output.push(result)
        end
      end
      # rubocop:enable Metrics/AbcSize
    end
  end
end
