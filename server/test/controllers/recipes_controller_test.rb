require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "any visiter can see all the recipes" do
    get "/api/recipes"
    # should return all the recipes
    puts "All recipes: " + response.body
  end

  test "a user can create a new recipe with multiple ingredients and procedures" do

    post "/api/signup",
      params: { email: "test@test.com", password: "sample" }
    post "/api/login", 
      params: { email: "test@test.com", password: "sample" }
    token = JSON.parse(response.body)["token"]
    assert_response :success

    #create recipes
    post "/api/createrecipe",
      headers: { "Authorization": "Bearer #{token}" },
      params: { name: "a new recipe"}
    assert_response :success
    post "/api/createrecipe",
      headers: { "Authorization": "Bearer #{token}" },
      params: { name: "an another recipe"}
    assert_response :success
    puts "Recipe created" + response.body

    get "/api/userrecipes",
      headers: { "Authorization": "Bearer #{token}" }
    puts "All Recipe created that user: " + response.body
    assert_response :success

    # user add an ingredient to a recipe
    post "/api/addingredient",
      headers: { "Authorization": "Bearer #{token}" },
      params: { id: 1, ingredient: "a new ingredient", amount: "1", unit: "oz"}
    assert_response :success
    
    # user add a procedure 
    post "/api/addprocedure",
      headers: { "Authorization": "Bearer #{token}" },
      params: { id: 1, ingredient: "a new ingredient"}
    assert_response :success
    puts "added procedure " + response.body
  end



end
