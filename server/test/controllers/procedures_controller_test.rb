require "test_helper"
require "./test/controllers/controller_test_helper"

class ProceduresControllerTest < ActionDispatch::IntegrationTest
    include ControllerTestHelper
    setup do
      @token = login
    end
    teardown do
      Rails.cache.clear
    end
  
    test "create procedures" do
      post "/api/procedures",
        headers: { "Authorization": "Bearer #{@token}" },
        params: { content: "a new procedure", recipe_id: "1"}
      assert_response :created
  
      resJSON = JSON.parse(response.body)
      content = resJSON["content"]
      recipe_id = resJSON["recipe_id"]
  
      assert_equal "a new procedure", content
      assert_equal 1, recipe_id
    end
  
    test "view all procedures" do
      get "/api/procedures"
      assert_response :success
      recipes_length = JSON.parse(response.body).length
      assert_equal 2, recipes_length
    end
  
    test "view ingredient by id" do
      get "/api/procedures/1"
      assert_response :success
  
      resJSON = JSON.parse(response.body)
      content = resJSON["content"]
      recipe_id = resJSON["recipe_id"]
  
      assert_equal "Hello I am a produre.", content
      assert_equal 1, recipe_id
    end
  
    test "update procedure by id" do
      patch "/api/procedures/1",
        headers: { "Authorization": "Bearer #{@token}" },
        params: { content: "a procedure with a new content"}  
      assert_response :accepted
  
      get "/api/procedures/1"
      assert_response :success
      content = JSON.parse(response.body)["content"]
      assert_equal "a procedure with a new content", content
    end
  
    test "delete procedure by id" do
      delete "/api/procedures/1",
        headers: { "Authorization": "Bearer #{@token}" }
      assert_response :see_other
  
      get "/api/procedures"
      assert_response :success
      length = JSON.parse(response.body).length
      assert_equal 1, length
    end  

end