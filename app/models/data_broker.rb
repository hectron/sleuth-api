# frozen_string_literal: true

DataBroker = Struct.new(:id, :name, :url, :opt_out_url, :opt_out_type, :notes, keyword_init: true) do
  # @return [Array[DataBroker]]
  def self.all
    @all ||= Rails.application.config_for(:data_brokers).brokers.map { |_name, attrs| new(**attrs) }
  end
end
