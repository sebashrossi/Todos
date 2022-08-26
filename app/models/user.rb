class User < ApplicationRecord
  has_many :todos, dependent: :destroy

  validates_presence_of :name, :email
end
