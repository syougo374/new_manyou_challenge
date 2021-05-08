class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :daytime, presence: true
  # default_scope -> { order(created_at: :desc) }
  enum status: { 未着手: 1, 着手: 2, 完了: 3 }
end
