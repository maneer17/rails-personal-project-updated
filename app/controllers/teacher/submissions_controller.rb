class Teacher::SubmissionsController < ApplicationController
  expose :teacher, :current_teacher
  expose :course, parent: :teacher
  expose :assignment, parent: :course
  expose :submissions, from: :assignment
end
