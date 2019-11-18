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



# create time slots
starttime = 10	
endtime = 20

#while starttime < endtime do 
#	ts = starttime.to_s+':00'
#	Timeslot.create!(start: ts)
#	ts = starttime.to_s+':30'
#	Timeslot.create!(start: ts)
#	starttime += 1
#end	


ts_all = ['10:00', '10:45', '11:30', '12:15',
					'13:00', '13:45', '14:30', '15:15',
					'16:00', '16:45', '17:30', '18:15',
					'19:00']

ts_all.each do |ts|
	Timeslot.create!(start: ts)
end


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


#open_close
open_close_types = ['Open', 'Closed']
open_close_types.each do |o|
	OpenClose.create!(name: o)
end


#activities
activity_types = ['Open','Practice', 'Lesson', 'Closed']
activity_types.each do |a|
	Activity.create!(name: a)
end



open_close_type_open = OpenClose.first
open_close_type_closed = OpenClose.last


#day
day = Date.today
lastday = Date.new(2019,12,01)

while day <= lastday do
	Day.create!(name: day, open_close: open_close_type_open)
	day += 1

	if day.monday? 
		Day.create!(name: day, open_close: open_close_type_closed)
		day += 1
	end
end



membership_type_Operator = Membership.first
membership_type_Admin = Membership.last
membership_type_Coaching = Membership.find_by name: 'Coaching'
membership_type_Practice = Membership.find_by name: 'Practice'

age_group_type_adult = AgeGroup.first
age_group_type_junior = AgeGroup.last

activity_type_open = Activity.first
activity_type_closed = Activity.last


Member.create!(firstname:'Serge', lastname:'Lafontaine', email: 'slafontaine10@gmail.com', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Admin, age_group: age_group_type_adult)
m = Member.create!(firstname: '-', lastname: '-', email: 'open@marshesgolfclub.com', password: 'MarshesRocks', password_confirmation: 'MarshesRocks', membership: membership_type_Operator, age_group: age_group_type_adult)
Member.create!(firstname: 'Derek', lastname: 'MacDonald', email: 'derek.macdonald@marshesgolfclub.com', password: 'MarshesRocks', password_confirmation: 'MarshesRocks', membership: membership_type_Operator, age_group: age_group_type_adult)
Member.create!(firstname: 'Carson', lastname: 'Scissons', email: 'carson.scissons@marshesgolfclub.com', password: 'MarshesRocks', password_confirmation: 'MarshesRocks', membership: membership_type_Operator, age_group: age_group_type_adult)
Member.create!(firstname: 'Ashley', lastname: 'Lafontaine', email: 'ashleylafontaine27@gmail.com', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Coaching, age_group: age_group_type_junior)






@days = Day.all
@timeslots = Timeslot.all

@days.each do |d|
	@timeslots.each do |t|

		if d.name.sunday? and (t.id > 9)
			Reservation.create!(timeslot: t, member: m, day: d, activity: activity_type_closed, bay: 1 )
			Reservation.create!(timeslot: t, member: m, day: d, activity: activity_type_closed, bay: 2 )
		else
			Reservation.create!(timeslot: t, member: m, day: d, activity: activity_type_open, bay: 1 )
			Reservation.create!(timeslot: t, member: m, day: d, activity: activity_type_open, bay: 2 )
		end
	end
end	












#Member.create!(email: 'slafontaine10@gmail.com', firstname: 'Serge', lastname: 'Lafontaine', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Admin, age_group: age_group_type_adult)







AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?