# frozen_string_literal: true

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "it generated the correct routes" do
    assert_routing({ path: "users", method: :get }, { controller: "users", action: "index" })
  end

  test "it returns a list of users" do
    get users_url
    assert_response :success
  end

  test "it shows a specific user" do
    user = users(:one)
    get user_url(user)
    assert_response :success
  end

  test "it returns an error when it does not find a user" do
    get user_url(-1)
    assert_response :unprocessable_entity
  end
end
