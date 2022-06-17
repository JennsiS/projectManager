class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    def after_sign_in_path_for(resource)
        sign_in_url = new_user_session_url
        if request.referer == sign_in_url
          super
        end
    end
end
