# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "action_view"
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  @@COLORS = ["red", "green", "blue", "violet", "orange", "yellow", "white", "black", "tabby"]

  validates :sex, inclusion: {in: ['M', 'F']}
  validates :birth_date, :color, :name, :sex, presence: true

  has_many :cat_rental_request
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest
    
  def age
    today = Date.today
    age = today.year - self.birth_date.year
    age += 1 if today.yday <= self.birth_date.yday 
    return age
  end
  
  def self.allowed_colors
    @@COLORS
  end

end
