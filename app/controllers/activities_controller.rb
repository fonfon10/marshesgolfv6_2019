class ActivitiesController < InheritedResources::Base
before_action :authenticate_member!


  private

    def activity_params
      params.require(:activity).permit(:name)
    end
end

