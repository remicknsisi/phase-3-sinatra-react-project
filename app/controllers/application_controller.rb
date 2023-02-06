class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/recipes" do
    recipes = Recipe.all
    recipes.to_json
  end

  get "/recipes/:id" do
    recipe = Recipe.find(paramsp[:id])
    recipe.to_json
  end

end
