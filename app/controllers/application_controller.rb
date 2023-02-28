class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  #Index Route for Recipes
  get "/recipes" do
    recipes = Recipe.all
    recipes.to_json(
      include: [:reviews]
    )
  end

  # Recipes Show Route
  get "/chefs/:chef_id/recipes/:id" do
    chef = Chef.find_by(id: params[:chef_id])
    recipe = Recipe.find_by(id: params[:id])
    if recipe
      recipe.to_json(
        include: [:reviews]
      )
    else
      "404 - Recipe not found"
    end
  end

  #Recipes Create Route
  post "/chefs/:chef_id/recipes" do
    chef = Chef.find_by(id: params[:chef_id])
    recipe = chef.recipes.create(params)
    recipe.to_json(
      include: [:reviews]
    )
  end

  #Recipes Destroy Route
  delete "/recipes/:id" do
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy
    recipe.to_json
  end

  #Recipes Update Route
  patch "/chefs/:chef_id/recipes/:id" do
    chef = Chef.find_by(id: params[:chef_id])
    recipe = chef.recipes.find_by(id: params[:id])
    recipe.update(
      isFavorited: params[:isFavorited]
    )
    recipe.to_json
  end

  # Index Route for Chefs
  get "/chefs" do
    chefs = Chef.all
    chefs.to_json(
      include: [:recipes, :reviews]
    )
  end

  #Chefs Show Route
  get "/chefs/:id" do
    chef = Chef.find_by(id: params[:id])
    if chef
      chef.to_json(
        include: [:recipes, :reviews]
      )
    else
      "404 - Chef not found"
    end
  end

  #Chefs Create Route
  post "/chefs" do
    chef = Chef.create(first_name: params[:first_name], last_name: params[:last_name], image: params[:image], age: params[:age])
    chef.to_json
  end

  #Chefs Destroy Route
  delete "/chefs/:id" do
    chef = Chef.find_by(id: params[:id])
    chef.destroy
    chef.to_json
  end

  #Chefs Update Route
  patch "/chefs/:id" do
    chef = Chef.find_by(id: params[:id])
    chef.update(params)
    chef.to_json
  end

  # Index Route for Reviews - not being used in front end
  get "/reviews" do
    reviews = Review.all
    reviews.to_json
  end

  #Reviews Create Route
  post "/recipes/:recipe_id/reviews" do
    recipe = Recipe.find_by(id: params[:recipe_id])
    review = recipe.reviews.create(params)
    review.to_json
  end

  #Reviews Destroy Route
  delete "/reviews/:id" do
    review = Review.find_by(id: params[:id])
    review.destroy
    review.to_json
  end

end