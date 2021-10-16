class Goal < ApplicationRecord

  validates :name, presence: true
  validates :details, presence: true
  validates :status, inclusion: [true, false]

  belongs_to :user
end
