class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/recipes" do
    recipes = Recipe.all
    recipes.to_json
  end

end
