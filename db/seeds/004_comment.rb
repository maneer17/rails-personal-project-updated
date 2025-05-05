require 'faker'
15.times do
  post_id = (Post.all.to_a.sample).id
  student_id = (Student.all.to_a.sample).id
  Comment.create(body: Faker::Quote.matz,course_id: course_id,student_id:student_id)
end