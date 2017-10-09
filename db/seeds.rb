
types = []
types << Type.create!(name: "Dia")
types << Type.create!(name: "Noite")
types << Type.create!(name: "Festa")
types << Type.create!(name: "Colorida")
types << Type.create!(name: "Neutra")
types << Type.create!(name: "Iluminada")
types << Type.create!(name: "Artistica")
types << Type.create!(name: "Casamento")
types << Type.create!(name: "Inspirações")

# Admin User
User.create!(email: 'makeyourmaketeste@gmail.com', first_name: 'Admin',
            last_name: 'Adminorino', artistic_name: 'Make Admin',
            password: 'poihd5rh4', admin: true, professional: false)

