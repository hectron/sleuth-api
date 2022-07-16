# frozen_string_literal: true

class DataBrokersController < ApplicationController
  def index
    render json: { brokers: DataBroker.all }
  end
end
