require 'faker'

20.times do
  # Mai: remove ().id & to_a, just Course.all.sample.id
  course_id = (Course.all.to_a.sample).id

  Post.create(title: Faker::Commerce.product_name, body: Faker::Quote.matz, course_id: course_id)
end
