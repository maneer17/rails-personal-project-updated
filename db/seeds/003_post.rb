require 'faker'

20.times do
  course_id = (Course.all.to_a.sample).id

  Post.create(title: Faker::Commerce.product_name, body: Faker::Quote.matz, course_id: course_id)
end
