class Room < ApplicationRecord
  has_many :people
  acts_as_tenant(:account)
end
