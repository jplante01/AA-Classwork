# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment
#what students are enrolled in the course
  has_many :enrolled_students, #method name
    through: :enrollments, #helper method
    source: :users

    has_many :prereq,
    primary_key: :prereq_id,
    foreign_key: :id,
    class_name: :Course

    belongs_to :instructor_id,
      primary_key: :instructor_id,
      foreign_key: :id,
      class_name: :User

    has_one :instructor_name,
      through: :instructor_id,
      source: :instructor_id
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