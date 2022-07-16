# frozen_string_literal: true

# A module for parsing an HTML page using Nokogiri
module Search
  module Spokeo
    class Parser
      ListingCssClass = ".single-column-list-item"
      TitleCssClass = ".title"

      def self.parse(html)
        new(html).parse
      end

      def initialize(html)
        @html = html
      end

      def parse
        @html_node = Nokogiri::HTML(@html)
        listing_nodes = @html_node.css(ListingCssClass)

        listing_nodes.each_with_object([]) do |listing_node, output|
          title_node = listing_node.at_css(TitleCssClass)

          url = "http://www.spokeo.com#{listing_node["href"]}"
          name_and_age = title_node.text.split(", ")
          name = name_and_age.first
          age = name_and_age.second&.to_i

          output.push({ name:, age:, url: })
        end
      end
    end
  end
end
