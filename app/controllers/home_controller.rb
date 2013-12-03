class HomeController < ApplicationController
	skip_before_filter :require_login
	def index
		if user_signed_in?
			@patients = current_user.patients.where("flaged = ?",true)
		end
	end
end
