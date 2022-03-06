require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "a user can create a new recipe with multiple ingredients and procedures" do

    post "/api/signup",
      params: { email: "test@test.com", password: "sample" }
    post "/api/login", 
      params: { email: "test@test.com", password: "sample" }
    user = JSON.parse(response.body)
    token = user["token"]
    assert_response :success

    # create recipes
    post "/api/recipes",
      headers: { "Authorization": "Bearer #{token}" },
      params: { title: "a new recipe"}
    assert_response :created
    title = JSON.parse(response.body)["title"]
    assert_equal "a new recipe", title

    # view all recipes
    get "/api/recipes"
    assert_response :success
    puts "All recipes: " + response.body

    # view recipe by id
    get "/api/recipes/1"
    assert_response :success
    puts "recipe with id 1: " + response.body

    # update recipe by id
    patch "/api/recipes/1",
      headers: { "Authorization": "Bearer #{token}" },
      params: { title: "a new recipe with a new title"}  
    assert_response :accepted
    title = JSON.parse(response.body)["title"]
    assert_equal "a new recipe with a new title", title

    delete "/api/recipes/1",
      headers: { "Authorization": "Bearer #{token}" }
    assert_response :ok

    get "/api/recipes"
    assert_response :success
    puts "All recipes: " + response.body

    get "/api/user/recipes/",
      headers: { "Authorization": "Bearer #{token}" }
    assert_response :success
    puts "All recipes: " + response.body
  end
end
