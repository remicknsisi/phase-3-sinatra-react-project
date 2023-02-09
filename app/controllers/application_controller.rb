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
    recipe = Recipe.create(name:params[:name], instructions:params[:instructions], image_url: params[:image_url], hours: params[:hours], ingredients: params[:ingredients], rating: params[:rating], cuisine_type: params[:cuisine_type], isFavorited: false)
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

end
