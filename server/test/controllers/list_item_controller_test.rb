require "test_helper"
require "./test/controllers/controller_test_helper"

class ListItemsControllerTest < ActionDispatch::IntegrationTest
  include ControllerTestHelper
  setup do
    @token = login
  end
  teardown do
    Rails.cache.clear
  end

  test "create list_item" do
    post "/api/list_items",
      headers: { "Authorization": "Bearer #{@token}" },
      params: { amount: "42", ingredient_id: "2"}
    assert_response :created
  end

#   test "view all amounts" do
#     get "/api/amounts"
#     assert_response :success
#     recipes_length = JSON.parse(response.body).length
#     assert_equal 2, recipes_length
#   end

#   test "view amounts by id" do
#     get "/api/amounts/1"
#     assert_response :success

#     resJSON = JSON.parse(response.body)
#     amount = resJSON["amount"]
#     ingredient_id = resJSON["ingredient_id"]
#     recipe_id = resJSON["recipe_id"]

#     assert_equal 2, amount
#     assert_equal 1, ingredient_id
#     assert_equal 1, recipe_id
#   end

#   test "update amounts by id" do
#     patch "/api/amounts/1",
#       headers: { "Authorization": "Bearer #{@token}" },
#       params: { amount: "33"}  
#     assert_response :accepted

#     get "/api/amounts/1"
#     assert_response :success
#     amount = JSON.parse(response.body)["amount"]
#     assert_equal 33, amount
#   end

#   test "delete amounts by id" do
#     delete "/api/amounts/1",
#       headers: { "Authorization": "Bearer #{@token}" }
#     assert_response :see_other

#     get "/api/amounts"
#     assert_response :success
#     length = JSON.parse(response.body).length
#     assert_equal 1, length
#   end

end