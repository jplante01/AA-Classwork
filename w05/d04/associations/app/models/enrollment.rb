# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
  belongs_to :courses,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course

  belongs_to :users,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User
end


# class Strike < ApplicationRecord
#   belongs_to :student,
#   	primary_key: :id,
#   	foreign_key: :student_id,
#   	class_name: :Student
# end

# def belongs_to(:name, options = {})
# end

# class Post < ApplicationRecord
#   #validations go here
#   belongs_to :user,
#     primary_key: :id,
#     foreign_key: :author_id,
#     class_name: :User
# end

# class User < ApplicationRecord
#   #validations go here
#   has_many :posts,
#     primary_key: :id,
#     foreign_key: :author_id,
#     class_name: :Post
# end