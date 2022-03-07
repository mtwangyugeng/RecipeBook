require "test_helper"
require "./test/controllers/controller_test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  include ControllerTestHelper
  setup do
    @token = login
  end
  teardown do
    Rails.cache.clear
  end

  test "create ingredient" do
    post "/api/ingredients",
      headers: { "Authorization": "Bearer #{@token}" },
      params: { name: "a new ingredient", image_url: "http://example.com", unit: "ml"}
    assert_response :created

    resJSON = JSON.parse(response.body)
    name = resJSON["name"]
    image_url = resJSON["image_url"]
    unit = resJSON["unit"]

    assert_equal "a new ingredient", name
    assert_equal "http://example.com", image_url
    assert_equal "ml", unit
  end

  test "view all ingredients" do
    get "/api/ingredients"
    assert_response :success
    recipes_length = JSON.parse(response.body).length
    assert_equal 2, recipes_length
  end

  test "view ingredient by id" do
    get "/api/ingredients/1"
    assert_response :success

    resJSON = JSON.parse(response.body)
    name = resJSON["name"]
    image_url = resJSON["image_url"]
    unit = resJSON["unit"]

    assert_equal "egg", name
    assert_equal "http://example.com", image_url
    assert_equal "piece", unit
  end

  test "update ingredient by id" do
    patch "/api/ingredients/1",
      headers: { "Authorization": "Bearer #{@token}" },
      params: { name: "a ingredient with a new name"}  
    assert_response :accepted

    get "/api/ingredients/1"
    assert_response :success
    name = JSON.parse(response.body)["name"]
    assert_equal "a ingredient with a new name", name
  end

  test "delete ingredient by id" do
    delete "/api/ingredients/1",
      headers: { "Authorization": "Bearer #{@token}" }
    assert_response :see_other

    get "/api/ingredients"
    assert_response :success
    length = JSON.parse(response.body).length
    assert_equal 1, length
  end

end