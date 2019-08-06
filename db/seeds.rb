# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
first_admin = Admin.create()
first_person = Person.create(name: 'Darlyn', last_name: 'Bravo Peña', ci: '8955883', birthday: Date.today - 20.years, address: 'Radial 26 5to anillo c/3 nro 10', phone_number: '61326223',rolable: first_admin)
first_user = User.create(email: 'bpdarlyn@gmail.com',password: 'naciel121293', password_confirmation: 'naciel121293', person: first_person)