require 'faker'

15.times do
  post_id = Post.all.sample.id
  student_id = Student.all.sample.id
  Comment.create(body: Faker::Quote.matz, post_id: post_id, student_id: student_id)
end
