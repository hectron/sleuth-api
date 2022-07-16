# frozen_string_literal: true

module Search
end
# class Search
#   attr_reader :user
#
#   def self.run(user)
#     new(user).search_spokeo
#   end
#
#   # @param [User] user
#   def initialize(user)
#     @user = user
#   end
#
#   def search_spokeo
#     # Example spokeo Search
#     #
#     # spokeo.com/Jane-Smith/Nebraska
#     params = { name: user.name, state: user.state }
#
#     # Convert to spokeo query string
#     params.each do |key, value|
#       params[key] = value.downcase.split(" ").map(&:capitalize).join("-")
#     end
#
#     response = Faraday.get("https://www.spokeo.com/#{params[:name]}/#{params[:state]}")
#
#     raise "Unable to get information about the user. Response code: #{response.status}" if response.status != 200
#
#     listings = parse_spokeo_results(response.body)
#   end
#
#   def parse_spokeo_results(html_string)
#     html_node = Nokogiri::HTML(html_string)
#
#     html_node.css(".single-column-list-item").map do |listing|
#       url = listing["href"]
#       title_node = listing.at_css(".title")
#       full_name = listing.text.split(", ").first
#       age = listing.text.split(", ").second
#     end
#   end
# end
