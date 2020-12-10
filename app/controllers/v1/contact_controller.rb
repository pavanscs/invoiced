class V1::ContactController < ApplicationController
	def index
		@contact = Contact.all

		render json: @contact, status: :ok
	end
	def create 
		@contact = Contact.new(contact_params)
		if @contact.save
			render json: @contact, status: :created
		end
	end 
	def destroy
		@contact = Contact.where(id: params[:id]).first
		if @contact.destroy
			head(:ok)
		else 
			head(:faild)
		end
	end

	private
	def contact_params
		params.permit(:first_name,:last_name,:email,:phone)
	end
end
