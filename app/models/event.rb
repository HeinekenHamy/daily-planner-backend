class Event < ApplicationRecord
  belongs_to :user

  validates :title, :date, presence: true
  validates :category, inclusion: { in: %w[Work Personal Health Other] }
  validates :priority, inclusion: { in: %w[Low Medium High] }
end
