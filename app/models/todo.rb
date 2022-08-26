class Todo < ApplicationRecord
  belongs_to :user
  enum status: [:to_do, :doing, :done]

  validates_presence_of :name, :status
end
