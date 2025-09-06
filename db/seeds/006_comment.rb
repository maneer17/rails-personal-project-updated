require 'faker'

7.times do
  post_id = Post.all.sample.id
  teacher_id = Teacher.all.sample.id
  Comment.create(body: Faker::Quote.matz, post_id: post_id, commenter_id: teacher_id, commenter_type: "Teacher")
end
15.times do
  post_id = Post.all.sample.id
  student_id = Student.all.sample.id
  Comment.create(body: Faker::Quote.matz, post_id: post_id, commenter_id: student_id, commenter_type: "Student")
end
