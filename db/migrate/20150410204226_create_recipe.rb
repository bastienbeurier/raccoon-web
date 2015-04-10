class CreateRecipe < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :healthiness
      t.integer :preparation
      t.integer :price
      t.attachment :image

      t.timestamps
    end

    create_table :ingredients do |t|
      t.integer :recipe_id
      t.string :description

      t.timestamps
    end

    create_table :steps do |t|
      t.integer :recipe_id
      t.string :description

      t.timestamps
    end
  end
end
