require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  teardown do
    Rails.cache.clear
  end

  test "created user is in a database" do
    post "/api/signup",
      params: { email: "test@test.com", password: "sample" }
    assert_response :created
    token = JSON.parse(response.body)["token"]

    get "/api/user",
      headers: { "Authorization": "Bearer #{token}" }
    email = JSON.parse(response.body)['email']
    assert_equal "test@test.com", email
  end

  test "created user can be logged in" do
    post "/api/login", 
      params: { email: "alice@test.com", password: "test" }
    assert_response :ok
    token = JSON.parse(response.body)["token"]

    get "/api/user",
      headers: { "Authorization": "Bearer #{token}" }
    email = JSON.parse(response.body)['email']
    assert_equal "alice@test.com", email
  end
end
