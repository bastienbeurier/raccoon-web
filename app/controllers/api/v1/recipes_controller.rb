class Api::V1::RecipesController < Api::V1::ApiController
  def index
    count = params[:count] ? params[:count] : 20
    offset = params[:offset] ? params[:offset] : 0
    order_by = params[:order_by] ? params[:order_by].to_sym : :created_at    

    if order_by == :healthiness
      recipes = Recipe.order(healthiness: :desc).limit(count).offset(offset)
    elsif order_by == :price
      recipes = Recipe.order(price: :desc).limit(count).offset(offset)
    else
      recipes = Recipe.order(created_at: :desc).limit(count).offset(offset)
    end

    render json: {result: {recipes: recipes.as_json(:include => [:ingredients, :steps])}}, status: 201
  end
end