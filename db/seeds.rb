# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(email: 'admin@admin.com', password: 'password')
user = User.create(email: 'user@user.com', password: 'password')

admin.plates.create(number: 'H123ser', state: 'ny')
admin.plates.create(number: 'H321FR', state: 'ny')
admin.plates.create(number: 'H156ser', state: 'ny')
admin.plates.create(number: '39386ML', state: 'ny')

admin.save
