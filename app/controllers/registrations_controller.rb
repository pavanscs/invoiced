class RegistrationsController < RailsJwtAuth::RegistrationsController

	def create
		# @users = User.all
	 	user = RailsJwtAuth.model.new(registration_create_params)
		uname = params[:user][:name][0..3].to_s
		# @users.each do |users|
		ucount = User.where("username like (?)","#{uname}%").count
		 
		if ucount > 0 
		 	user.username = uname + ucount.to_s
		else
		 	user.username = uname
		end

		user.save ? render_registration(user) : render_422(user.errors.details)
	end

end
