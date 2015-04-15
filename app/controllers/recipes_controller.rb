class RecipesController < ActionController::Base
  def new
    @recipe = Recipe.new
  end

  def create
    #Create recipe.
    @recipe = Recipe.new
    @recipe.title = params[:title]
    @recipe.image = params[:image]

    #Create ingredients.
    ingredients = []

    (1..10).each do |i|
      unless params["ingredient_#{i}".to_sym].blank?
        ingredient = Ingredient.new
        ingredient.description = params["ingredient_#{i}".to_sym]
        ingredients << ingredient
      end
    end

    #Create steps.
    steps = []

    (1..6).each do |i|
      unless params["step_#{i}".to_sym].blank?
        step = Step.new
        step.description = params["step_#{i}".to_sym]
        steps << step
      end
    end

    @recipe.ingredients = ingredients
    @recipe.steps = steps

    if ingredients.count > 0 and steps.count > 0 and @recipe.save
      @notice = 'Recipe created!'
      render action: "show"
    else
      @notice = 'Failed to save recipe... (no ingredient or no step)'
      render action: "new" 
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    @notice = 'Recipe deleted!'
    render action: "index"
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
