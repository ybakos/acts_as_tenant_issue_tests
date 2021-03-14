class Account < ApplicationRecord
  has_many :persons
  has_many :rooms
end
