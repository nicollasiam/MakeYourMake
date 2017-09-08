# Makes URLs
urls = ['https://i.pinimg.com/originals/11/13/6c/11136c3eabfd17d7de9559e7aaa75fb3.jpg',
        'http://www.pausaparafeminices.com/pausawp/wp-content/uploads/2016/12/natal-5.jpg',
        'http://rosamariaperfumaria.com.br/wp-content/uploads/2014/05/makeexpress.jpg',
        'https://blog.aazperfumes.com.br/wp-content/uploads/2013/08/capa5.jpg',
        'https://i.pinimg.com/originals/54/a3/63/54a363fe1223127a495156eab09b9e09.jpg',
        'http://www.digoporai.com/wp-content/uploads/2014/02/screen-shot-2013-02-09-at-11-33-06-am.png',
        'http://www.colorfun.com.br/wp-content/uploads/2012/07/529034_10151842378592699_2042719313_n.jpg']



types = []
types << Type.create!(name: "Dia")
types << Type.create!(name: "Noite")
types << Type.create!(name: "Festa")
types << Type.create!(name: "Colorida")
types << Type.create!(name: "Neutra")
types << Type.create!(name: "Artistica")
types << Type.create!(name: "Preto esfumado")
types << Type.create!(name: "Delineado gatinho")

# Admin User
User.create!(email: 'admin@admin.com', first_name: 'Admin',
            last_name: 'Adminorino', artistic_name: 'Awesome Admin',
            telephone_number: Faker::PhoneNumber.cell_phone, address: 'Admin has no address',
            password: 'admin123', admin: true, professional: false)

# Professional User
professional_user = User.create!(email: 'prof@prof.com', first_name: 'Professional',
                                last_name: 'Professionalino', artistic_name: 'Awesome Professional',
                                telephone_number: Faker::PhoneNumber.cell_phone, address: 'Professional great address',
                                password: 'prof123', admin: false, professional: true)

# Regular User
User.create!(email: 'reg@reg.com', first_name: 'Regular',
            last_name: 'Regularino',
            telephone_number: Faker::PhoneNumber.cell_phone,
            password: 'reg123')

# Create 10 more professionals (11 total)
professionals = []
professionals << professional_user

10.times do
  professionals << User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name,
                                last_name: Faker::Name.last_name, artistic_name: Faker::Simpsons.character,
                                telephone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_name,
                                password: 'jamones', professional: true)
end

# Give each professional 1..5 makes
makes = []
professionals.each do |professional|
  rand(1..5).times do
    make = Make.new(name: Faker::Name.name, description: Faker::Lorem.sentence,
    likes_count: Faker::Number.number(4), public: [true, false].sample, user: professional)

    # Give and image to the make
    image = Image.new()
    image.remote_image_url_url = urls.sample
    image.make = make
    image.save!

    # Give a type to the make
    make_type = MakeType.create!(make: make, type: types.sample)
    makes << make
  end
end

# Give reviews to public makes
makes.each do |make|
  if make.public
    3.times do
      Review.create!(score: Faker::Number.number(4),
      title: Faker::Name.title, content: Faker::Lorem.sentences, make: make, user: professionals.sample)
    end
  end
end




