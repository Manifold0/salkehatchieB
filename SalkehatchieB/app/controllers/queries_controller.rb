class QueriesController < ApplicationController
	before_action :is_admin

	def index
	end

	def campers_by_camp
		current_year = DateTime.now.year
    	date_registration_opens = DateTime.new(current_year, 1, 1)
    	date_registration_closes = DateTime.new(current_year+1, 1, 1)
    	@camps = Camp.where("(start_date >= ? AND start_date < ?)", date_registration_opens, date_registration_closes).all
	end

	def campers_not_paid
		all_users = User.all
		@users = Array.new
		all_users.each do |user|
			if user.current_balance > 0
				@users.push(user)
			end
		end
	end

	def background_checks
		all_users = User.all
		@users = Array.new
		all_users.each do |user|
			if !user.under_eighteen? && !user.background_check_valid?
				@users.push(user)
			end
		end
	end

	private
		def is_admin
			if current_user == nil
				redirect_to root_path
				return
			end
			if !current_user.is_admin?
      			redirect_to root_path
      		end
		end
end