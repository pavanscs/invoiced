module RailsJwtAuth
  class InvitationsController < ApplicationController
    include ParamsHelper
    include RenderHelper

    before_action :authenticate, only: [:create]
    before_action :set_user_from_token, only: [:show, :update]

    # used to verify token
    def show
      return render_404 unless @user

      @user.expired_invitation_token? ? render_410 : render_204
    end

    # used to invite a user, if user is invited send new invitation
    def create
      puts current_user.id.inspect
      user = RailsJwtAuth.model.invite(invitation_create_params,current_user)
      user.errors.empty? ? render_204 : render_422(user.errors.details)
    end

    # used to accept invitation
    def update
      return render_404 unless @user

      if @user.accept_invitation(invitation_update_params)
        render_204
      else
        render_422(@user.errors.details)
      end
    end

    private

    def set_user_from_token
      puts "set".inspect
      return if params[:id].blank?
      # puts params.inspect
      @user = RailsJwtAuth.model.where(invitation_token: params[:id]).first
    end
  end
end
