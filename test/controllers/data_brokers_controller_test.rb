# frozen_string_literal: true

require "test_helper"

class DataBrokersControllerTest < ActionDispatch::IntegrationTest
  test "it is routed properly" do
    assert_routing({ path: "data_brokers", method: :get }, { controller: "data_brokers", action: "index" })
  end

  test "it returns proper brokers" do
    get data_brokers_url
    assert_response :success
    sample_broker = @response.parsed_body["brokers"][0]

    broker_fields = sample_broker.keys

    %w[name id url opt_out_url opt_out_type notes].each do |key|
      assert_includes(broker_fields, key)
    end
  end
end
