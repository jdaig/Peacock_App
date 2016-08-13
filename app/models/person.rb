class Person < ApplicationRecord
  validates :description,  length: { maximum: 150 }

end
