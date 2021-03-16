class Person < ApplicationRecord
  belongs_to :room
  acts_as_tenant(:account)
end
