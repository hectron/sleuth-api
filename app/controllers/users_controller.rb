# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    users = User.all

    render json: users
  end

  def show
    user = User.find(permitted_params[:id])

    render json: user, status: :ok
  rescue StandardError
    render json: {}, status: :unprocessable_entity
  end

  private

  def permitted_params
    params.permit(:id)
  end
end
