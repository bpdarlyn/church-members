# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
first_admin = Admin.create()
first_person = Person.create(name: 'Darlyn', last_name: 'Bravo Peña',sex: 'M' ,ci: '8955883', birthday: Date.today - 20.years, address: 'Radial 26 5to anillo c/3 nro 10', phone_number: '61326223',rolable: first_admin)
first_user = User.create(email: 'bpdarlyn@gmail.com',password: 'naciel121293', password_confirmation: 'naciel121293', person: first_person)

TitleObtained.create(title_type: 'pastor', name: 'Pastor', code:5)
TitleObtained.create(title_type: 'lider', name: 'Líder', code: 4)
TitleObtained.create(title_type: 'miembro', name: 'Miembro', code: 3)
TitleObtained.create(title_type: 'visita', name: 'Visita', code: 2)
TitleObtained.create(title_type: 'prospecto', name: 'Prospecto', code: 1)

TypeOfCourse.create(name: 'Encuentro Tremendo', description: 'Encuentro Tremendo', code:1)
TypeOfCourse.create(name: 'Pre Encuentro', description: 'Pre Encuentro para el Tremendo', code:2)
TypeOfCourse.create(name: 'Encuentro Honra', description: 'Encuentro Tremendo', code:3)
TypeOfCourse.create(name: 'Encuentro Rescate', description: 'Encuentro Tremendo', code:4)
TypeOfCourse.create(name: 'Post Encuentro', description: 'Post Encuentro (Tremendo)', code:5)
TypeOfCourse.create(name: 'Estudio Bíblico 3 Preguntas', description: 'Las 3 preguntas más importantes de la vida', code:6)

TypeOfMeeting.create(name: 'Célula Evangelística', description: 'Reunión de Célula Evangelística', code: 1)
TypeOfMeeting.create(name: 'Célula Matriz', description: 'Reunión de Líderes', code: 2)

