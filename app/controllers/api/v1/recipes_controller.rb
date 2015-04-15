class Api::V1::RecipesController < Api::V1::ApiController
  def index
    count = params[:count] ? params[:count] : 20
    offset = params[:offset] ? params[:offset] : 0

    if params[:text].to_s.empty?
      recipes = Recipe.order(created_at: :desc).limit(count).offset(offset)
    else
      recipes = Recipe.where("keywords LIKE ?", "%#{params[:text]}%").order('title ASC').limit(count).offset(offset)
    end

    render json: {result: {recipes: Recipe.response(recipes)}}, status: 201
  end
end