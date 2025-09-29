10.times do |i|
  Student.create(
              email: Faker::Internet.email,
              password: "123456",
              name: "name#{i}",
              confirmed_at: Time.current
           )
end
