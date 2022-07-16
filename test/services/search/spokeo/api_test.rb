# frozen_string_literal: true

require "test_helper"
require "minitest/mock"

class SearchSpokeoApiTest < ActiveSupport::TestCase
  test "converting a state abbreviation" do
    state = "NY"

    name = Search::Spokeo::Api::STATE_USPS_ABBREVIATION_TO_NAME[state.to_sym]

    assert_equal name, "New York"
  end

  test "invoking via the class API" do
    api_mock = Minitest::Mock.new
    api_mock.expect(:run, true)
    user = User.new(first_name: "Eobard", last_name: "Thawne", state: "FL")

    Search::Spokeo::Api.stub(:new, api_mock) do
      Search::Spokeo::Api.run(user)
    end

    assert_mock api_mock
  end

  test "a bad request" do
    user = User.new(first_name: "Eobard", last_name: "Thawne", state: "FL")

    mock_client = Faraday.new do |builder|
      builder.adapter :test do |stub|
        stub.get("/Eobard-Thawne/Florida") { |_env| [400, {}, ""] }
      end
    end

    api = Search::Spokeo::Api.new(name: user.name, state: "Florida", http_client: mock_client)

    err = assert_raises RuntimeError do
      api.run
    end

    assert_equal "Unable to request user. Status: 400", err.message
  end
end
