class User < ApplicationRecord
    has_many :enrollments,
        class_name: 'Enrollment',
        foreign_key: :student_id,
        primary_key: :id

    has_many :enrolled_courses,
        through: :enrollments,
        source: :course

    has_many :taught_courses,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: "Course"
end
