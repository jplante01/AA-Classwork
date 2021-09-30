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