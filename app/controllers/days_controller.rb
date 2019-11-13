class DaysController < InheritedResources::Base

before_action :authenticate_member!


def index
#	@days = Day.first(7)

if Time.now.getlocal('-05:00').hour >= 7 #for heroku timezone
	number_of_days = 8	
else
	number_of_days = 7	
end

if current_member.membership.name != "Admin" and current_member.membership.name != "Operator"
	@days = Day.where('name >= ?', Date.today).first(number_of_days)
else
	@days = Day.all.order(id: :asc)
end

activity_lesson = Activity.find_by name: "Lesson"

if current_member.membership.name != "Operator"
	@reservations = Reservation.where('member_id = ?', current_member.id).order(id: :asc)
else
	@reservations = Reservation.where('activity_id = ?', activity_lesson.id).order(id: :asc)

end

		
end


def show
	nextDay = params[:id].to_i+1
  @nextDay = Day.find(nextDay)


	day = Day.find(params[:id])
	@reservations = Reservation.where('day_id = ?', day.id).order(id: :asc)
#	@reservations = r.order(id: :asc)
#	cr = @reservations.where('member_id = ?', current_member.id)
	if member_signed_in? and current_member.membership.name != "Operator"
  	@count_reservations = @reservations.where('member_id = ?', current_member.id).count
	end	
#  @count_reservations = cr.count

end


def toggle_open_close_status
	@day = Day.find(params[:id])
	open_close_type_open = OpenClose.first
	open_close_type_closed = OpenClose.last

	if @day.open_close.name == "Open"
		@day.update(open_close: open_close_type_closed)
	else
		@day.update(open_close: open_close_type_open)
	end

    @day.save
    redirect_to days_path

end



def edit
  @day = Day.find(params[:id])
  @open_closes = OpenClose.order('name ASC').map { |i| [i.name, i.id]}
end




  private

    def day_params
      params.require(:day).permit(:name, :open_close_id)
    end
end


