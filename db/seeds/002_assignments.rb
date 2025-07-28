require 'faker'

20.times do
  # Mai: remove ().id & to_a, just Course.all.sample.id
  course_id = (Course.all.to_a.sample).id
  deadline = Faker::Time.between(from: DateTime.now + 10, to: DateTime.now + 100, format: :long)

  Assignment.create(deadline: deadline, title: Faker::Commerce.product_name, content: Faker::Quote.matz, course_id: course_id)
end
