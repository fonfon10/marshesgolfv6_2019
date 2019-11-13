class TimeslotsController < InheritedResources::Base
before_action :authenticate_member!

  private

    def timeslot_params
      params.require(:timeslot).permit(:start)
    end
end

