class UsersController < ApplicationController
	before_action :authenticate_user!
	def search
		if params[:term].present?
			@users = User.search (params[:term]), fields: [:username, :email], match: :word_start
		else
			redirect_back fallback_location: root_path
			flash[:notice] = "No Users match your search"
		end
	end
end