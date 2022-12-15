# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

teacher = User.create(email: "teacher@teacher.com", password: "default123", account_id: 1)
ta = User.create(email: "ta@ta.com", password: "default123", account_id: 0)

g1 = Grade.create(student_id: "10211", student_name: "Andrew Bird", student_grade: 80)
g2 = Grade.create(student_id: "10212", student_name: "Anderson Silva", student_grade: 90)
g3 = Grade.create(student_id: "10213", student_name: "Rafael Mendes", student_grade: 100)
g4 = Grade.create(student_id: "10214", student_name: "Emmett Tomai", student_grade: 90)
g5 = Grade.create(student_id: "10215", student_name: "Robert Schweller", student_grade: 90)
g6 = Grade.create(student_id: "10216", student_name: "Tim Wylie", student_grade: 90)