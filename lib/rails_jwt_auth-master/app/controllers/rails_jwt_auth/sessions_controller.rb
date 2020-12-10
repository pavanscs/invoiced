module RailsJwtAuth
  class SessionsController < ApplicationController
    include ParamsHelper
    include RenderHelper
    before_action :authenticate, only: [:destroy]

    def create
      puts params.inspect
      se = Session.new(session_create_params)

      if se.generate!(request)
        render_session se.jwt, se.user
      else
        render_422 se.errors.details
      end
    end

    def destroy
      return render_404 unless RailsJwtAuth.simultaneous_sessions > 0
      current_user.destroy_auth_token @jwt_payload['auth_token']
      render_204
    end
  end
end
# if current_user.present?
  #current_user.destroy_auth_token @jwt_payload['auth_token']
# else
#   render_410
# end