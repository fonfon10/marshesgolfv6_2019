class OpenClosesController < InheritedResources::Base
before_action :authenticate_member!

  private

    def open_close_params
      params.require(:open_close).permit(:name)
    end
end

