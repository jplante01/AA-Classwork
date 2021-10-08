require "action_view"
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :sex, inclusion: {in: ['M', 'F']}
  validates :birth_date, :colors, :name, :sex, presence: true

  def age
    today = Date.today
    age = today.year - self.birth_date.year
    age += 1 if today.yday < self.birth_date.yday 
    return age
  end
end
