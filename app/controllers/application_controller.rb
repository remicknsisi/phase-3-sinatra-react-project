class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
# including this to meet read requirement
# Index Route for Recipes
  get "/recipes" do
    recipes = Recipe.all
    recipes.to_json
    # will need to restructure recipe CRUD actions in front end and updating of state - now that we are accessing via chef (remove chef_id foreign key)
    # adding/deleting a recipe is now being treated as an update for a chef
  end

  #Recipes Show Route
  get "/recipes/:id" do
    recipe = Recipe.find_by(id: params[:id])
    if recipe
      recipe.to_json
    else
      "404 - Recipe not found"
    end
  end

  #Recipes Create Route
  post "/chefs/:chef_id/recipes" do
    chef = Chef.find_by(id: params[:chef_id])
    recipe = chef.recipes.create(params)
    # name: params[:name], instructions: params[:instructions], image_url: params[:image_url], hours: params[:hours], ingredients: params[:ingredients], chef_id: params[:chef_id], cuisine_type: params[:cuisine_type], isFavorited: params[:isFavorited]
    recipe.to_json
  end

  #Recipe Destroy Route
  delete "/chefs/:chef_id/recipes/:id" do
    chef = Chef.find_by(id: params[:chef_id])
    recipe = chef.recipes.find_by(id: params[:id])
    recipe.destroy
    recipe.to_json
  end

  patch "/recipes/:id" do
    recipe = Recipe.find_by(id: params[:id])
    recipe.update(
      isFavorited: params[:isFavorited]
    )
    recipe.to_json
  end

  # do i need a patch that relies on a form? (technically can slide but try to replace this with a form)

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

  post "/chefs" do
    chef = Chef.create(first_name: params[:first_name], last_name: params[:last_name], image: params[:image], age: params[:age])
    chef.to_json
  end

  delete "/chefs/:id" do
    chef = Chef.find_by(id: params[:id])
    chef.destroy
    chef.to_json
  end

  get "/reviews" do
    reviews = Review.all
    reviews.to_json
  end

  post "/reviews" do
    review = Review.create(comment:params[:comment], rating:params[:rating], recipe_id: params[:recipe_id], author_name: params[:author_name])
    review.to_json
  end

end
