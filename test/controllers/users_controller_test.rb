# frozen_string_literal: true

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "it generated the correct routes" do
    assert_routing({ path: "users", method: :get }, { controller: "users", action: "index" })
  end
  # test "the truth" do
  #   assert true
  # end
end
