class User < ApplicationRecord
  has_many :todos

  validates_presence_of :name, :email
end
