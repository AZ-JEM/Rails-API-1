class Todo < ApplicationRecord
  validates :title, presence: true
  validates :desc, presence: true
  validates :done, presence: true
end
