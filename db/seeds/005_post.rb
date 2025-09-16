require 'faker'

20.times do
  course_id = Course.all.sample.id

  Post.create(title: Faker::Commerce.product_name,
  body: Faker::Quote.matz,
  course_id: course_id)
end
