class Company < ApplicationRecord
  has_one :users, as: :profile
  has_one :info_co
end
