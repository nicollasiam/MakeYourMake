Type.create!(name: "Dia")
Type.create!(name: "Noite")
Type.create!(name: "Festa")
Type.create!(name: "Colorida")
Type.create!(name: "Neutra")
Type.create!(name: "Artistica")
Type.create!(name: "Preto esfumado")
Type.create!(name: "Delineado gatinho")

users = []
10.times do
  users << User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name, artistic_name: Faker::Simpsons.character,
  telephone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_name,
  password: "jamones", admin: [true, false].sample)
end
makes = []
users.each do |user|
  5.times do
    makes << Make.create!(name: Faker::Name.name, description: Faker::Lorem.sentence,
    likes_count: Faker::Number.number(4), public: true, user_id: user.id)
  end
end

makes.each do |make|
  3.times do
    Review.create!(score: Faker::Number.number(4),
    title: Faker::Name.title, content: Faker::Lorem.sentences, make_id: make.id)
  end
end




