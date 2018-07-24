module Admin
  class BaseController < ApplicationController
    before_action :validate_admin!

    private

    def validate_admin!
      unless current_user.is_admin?
        head :forbidden
      end
    end
  end
end
