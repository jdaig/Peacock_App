class Person < ApplicationRecord
  has_one :users, as: :profile
  has_one :info_per
end
