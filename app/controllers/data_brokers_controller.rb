# frozen_string_literal: true

class DataBrokersController < ApplicationController
  def index
    broker_config = Rails.application.config_for(:data_brokers).brokers

    brokers = broker_config.map do |name, fields|
      { name: }.merge(fields)
    end

    render json: { brokers: }
  end
end
