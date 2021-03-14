class Room < ApplicationRecord
  acts_as_tenant(:account)
  has_many :people
end
