class Person < ApplicationRecord
  acts_as_tenant(:account)
  belongs_to :room
end
