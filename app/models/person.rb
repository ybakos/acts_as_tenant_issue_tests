class Person < ApplicationRecord
  belongs_to :account
  belongs_to :room
end
