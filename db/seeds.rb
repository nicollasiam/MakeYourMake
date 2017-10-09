
types = []
types << Type.create!(name: "Dia")
types << Type.create!(name: "Noite")
types << Type.create!(name: "Festa")
types << Type.create!(name: "Colorida")
types << Type.create!(name: "Neutra")
types << Type.create!(name: "Artistica")
types << Type.create!(name: "Casamento")
types << Type.create!(name: "Iluminada")

# Admin User
User.create!(email: 'admin@admin.com', first_name: 'Admin',
            last_name: 'Adminorino', artistic_name: 'Awesome Admin',
            password: 'admin123', admin: true, professional: false)

