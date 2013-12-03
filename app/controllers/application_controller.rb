class ApplicationController < ActionController::Base
	include ActionView::Helpers::NumberHelper
	
	protect_from_forgery
	helper_method :calculate_invoice_sum
	helper_method :calculate_costitem_amount
	helper_method :currency
	helper_method :time

	before_filter :require_login
  
	def require_login
	    unless current_user
	    	unless request.env['REQUEST_PATH'] == new_user_session_path || request.env['REQUEST_PATH'] == user_session_path || request.env['REQUEST_PATH'] == destroy_user_session_path || request.env['REQUEST_PATH'] == user_password_path || request.env['REQUEST_PATH'] == new_user_password_path || request.env['REQUEST_PATH'] == edit_user_password_path || request.env['REQUEST_PATH'] == cancel_user_registration_path || request.env['REQUEST_PATH'] == user_registration_path || request.env['REQUEST_PATH'] == new_user_registration_path || request.env['REQUEST_PATH'] == edit_user_registration_path
				redirect_to home_index_url
			end
		end
	end

	def calculate_invoice_sum(invoice)
		@sum = 0
		@invoice_items = invoice.costItems
		@invoice_items.each do |item|
			@sum = @sum+item.amount
		end
		invoice.sum=@sum
		invoice.save
	end

	def calculate_costitem_amount(item)
		@amount = 0
		#["plain", "hourly", "driving"]
		if item.costType.type_class == CostType::TYPES[0]
			@amount = item.costType.prize
		elsif item.costType.type_class == CostType::TYPES[2]
			@amount = @amount+(item.costType.prize*item.quantity)
		elsif item.costType.type_class == CostType::TYPES[1]
			item.quantity = Integer(((item.endTime-item.startTime)/60)/item.costType.interval)
			@amount = item.costType.prize*item.quantity
		end
		item.amount=@amount
		item.save
	end

	def currency(number)
		number_to_currency(number, unit:"&euro;", separator:",", delimiter:".", format:"%n%u")
	end
	def time(number)
		number.strftime('%d.%m.%Y')
	end
end
