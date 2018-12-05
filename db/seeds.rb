# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create!({name: 'Test', description: 'Example user', email: 'test@example.com' })

t = SurveyTemplate.new({name: 'Survey_1', description: 'First survey'})
t.data = Hash.new
t.data[:steps_number] = 3
t.data[:available_steps] = Array.new
t.data[:available_steps] << {name: 'Red state', color: 'red'}
t.data[:available_steps] << {name: 'Blue state', color: 'blue'}
t.save!

s = Survey.create!({token: '12345', user_id: u.id, template_id: t.id})
