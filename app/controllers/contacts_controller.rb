class ContactsController < ApplicationController
	before_action :set_contact, only: [:show, :edit, :update, :destroy]

	def new
		@contact = Contact.new
	end
	
	def create
		@contact = Contact.new(picture_params)
		if @picture.save
			ContactMailer.contact_mail(@picture).deliver
			redirect_to contacts_path, notice: 'Contact was successfully created.'
		else
			render :new
		end
	end

	def new
	end

	private

	def set_contact
		@contact = Contact.find(params[:id])
	end

	def contact_params
		params.require(:contact).permit(:name, :email, :content)
	end
end