# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Membership.delete_all
AgeGroup.delete_all
Member.delete_all


#membership
membership_types = ['Operator','Practice', 'Coaching', 'Admin']

membership_types.each do |m|
	Membership.create!(name: m)
end


#age_group
age_group_types = ['Adult', 'Junior']
age_group_types.each do |a|
	AgeGroup.create!(name: a)
end


membership_type_Operator = Membership.first
membership_type_Admin = Membership.last
membership_type_Coaching = Membership.find_by name: 'Coaching'
membership_type_Practice = Membership.find_by name: 'Practice'

age_group_type_adult = AgeGroup.first
age_group_type_junior = AgeGroup.last


Member.create!(email: 'slafontaine10@gmail.com', firstname: 'Serge', lastname: 'Lafontaine', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Admin, age_group: age_group_type_adult)







AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?