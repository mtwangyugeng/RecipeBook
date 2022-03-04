require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "created user can be logged in" do
    post "/api/signup",
      params: { email: "test@test.com", password: "sample" }
    post "/api/login", 
      params: { email: "test@test.com", password: "sample" }
    token = JSON.parse(response.body)["token"]
    get "/api/user",
      headers: { "Authorization": "Bearer #{token}" }
    puts response.body
  end


end