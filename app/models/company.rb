class Company < ApplicationRecord
  validates :description,  length: { maximum: 150 }
  has_many :relations
end
