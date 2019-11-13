class DashboardController < ApplicationController

before_action :authenticate_member!

  def index
  	activity_lesson = Activity.find_by name: "Lesson"
  	activity_practice = Activity.find_by name: "Practice"

  	@reservations_lessons = Reservation.where('activity_id = ?', activity_lesson.id).order(id: :asc)
  	@reservations_practice = Reservation.where('activity_id = ?', activity_practice.id).order(id: :asc)

  	@members = Member.all.order(lastname: :asc)

  end

  def show

  	# display any member stats if ADMIN/OPERATOR and only member stat if member
		if (current_member.membership.name == "Admin" or current_member.membership.name == "Operator")
			@member = Member.find(params[:id])
		else
			@member = current_member
		end

		@reservations = @member.reservations.order(activity_id: :desc)

  end
end
