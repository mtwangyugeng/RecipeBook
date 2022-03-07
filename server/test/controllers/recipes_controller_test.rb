require "test_helper"
require "./test/controllers/controller_test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  include ControllerTestHelper
  setup do
    @token = login
  end
  teardown do
    Rails.cache.clear
  end

  test "create recipe" do
    # create recipes
    post "/api/recipes",
      headers: { "Authorization": "Bearer #{@token}" },
      params: { title: "a new recipe"}
    assert_response :created
    title = JSON.parse(response.body)["title"]
    assert_equal "a new recipe", title
  end

  test "view all recipes" do
    get "/api/recipes"
    assert_response :success
    recipes_length = JSON.parse(response.body).length
    assert_equal 2, recipes_length
  end

  test "view recipe by id" do
    get "/api/recipes/1"
    assert_response :success
    title = JSON.parse(response.body)["title"]
    assert_equal "a new recipe", title
  end

  test "update recipe by id" do
    patch "/api/recipes/1",
      headers: { "Authorization": "Bearer #{@token}" },
      params: { title: "a new recipe with a new title"}  
    assert_response :accepted
    title = JSON.parse(response.body)["title"]
    assert_equal "a new recipe with a new title", title
  end

  test "delete recipe by id" do
    delete "/api/recipes/1",
      headers: { "Authorization": "Bearer #{@token}" }
    assert_response :see_other
    recipes_length = JSON.parse(response.body).length
    assert_equal 1, recipes_length
  end

end
