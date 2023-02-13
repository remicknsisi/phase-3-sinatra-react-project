class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/recipes" do
    recipes = Recipe.all
    recipes.to_json
  end

  get "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    recipe.to_json
  end

  post "/recipes" do
    recipe = Recipe.create(name:params[:name], instructions:params[:instructions], image_url: params[:image_url], hours: params[:hours], ingredients: params[:ingredients], chef_id: params[:chef_id], cuisine_type: params[:cuisine_type], isFavorited: false)
    recipe.to_json
  end

  delete "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    recipe.to_json
  end

  patch "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    recipe.update(
      isFavorited: params[:isFavorited]
    )
    recipe.to_json
  end

  get "/chefs" do
    chefs = Chef.all
    chefs.to_json
  end

  get "/chefs/:id" do
    chef = Chef.find(params[:id])
    chef.to_json
  end

  post "/chefs" do
    chef = Chef.create(first_name: params[:first_name], last_name: params[:last_name], image: params[:image], age: params[:age])
    chef.to_json
  end

  delete "/chefs/:id" do
    chef = Chef.find(params[:id])
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
