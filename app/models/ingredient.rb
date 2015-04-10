class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  
  validates :description, presence: true
end