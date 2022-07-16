# frozen_string_literal: true

require "test_helper"

class DataBrokerTest < ActiveSupport::TestCase
  test ".all returns data brokers" do
    results = DataBroker.all

    brokers = Rails.application.config_for(:data_brokers).brokers

    assert brokers.all? do |broker|
      results.any? do |data_broker|
        data_broker.id == broker[:id] && data_broker.name == broker[:name]
      end
    end
  end
end
