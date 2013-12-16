class QueriesController < ApplicationController
	before_action :is_admin, only: [:index,:campers_by_camp,:campers_not_paid, :background_checks]
	before_action :is_director, only: [:index_for_directors]

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

	def tshirt_sizes
		if params[:campid]
			@users = Array.new
			camp = Camp.find(params[:campid])
			camp.camp_assignments.each do |assignment|
				@users.push(assignment.user)
			end
		else
			@users = User.all
		end

		total_shirts
	end	

	def total_shirts
		@total_xxxl = 0
		@total_xxl = 0
		@total_xl = 0
		@total_l = 0
		@total_m = 0
		@total_s = 0
		@total_xs = 0
		@total_unknown = 0
		@users.each do |user|
			if user.tshirt_size
				if user.tshirt_size == "XXXL"
		      		@total_xxxl += 1
		    	elsif user.tshirt_size == "XXL"
		           	@total_xxl += 1
		        elsif user.tshirt_size == "XL"
		           	@total_xl += 1
		        elsif user.tshirt_size == "L"
		           	@total_l += 1
	           	elsif user.tshirt_size == "M"
		           	@total_m += 1
	           	elsif user.tshirt_size == "S"
		           	@total_s += 1
	           	elsif user.tshirt_size == "XS"
		           	@total_xs += 1
		    	else
		    		@total_unknown += 1
		    	end
		  	else
		  		@total_unknown += 1
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
		def is_director
			if current_user == nil
				redirect_to root_path
				return
			end
			if !current_user.is_camp_director_for_camp(Camp.find(params[:campid]))
      			redirect_to root_path
      		end
		end
end