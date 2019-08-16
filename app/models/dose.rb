class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  # You cant delete an ingredient if it is used by one single cocktail
  # here we are saying, Validate that an ingredient
  # validates :cocktail, uniqueness: { scope: :ingredient }
  validates_uniqueness_of :cocktail_id, scope: :ingredient_id
end
