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
    @total_large = 0
    @total_medium = 0
    @total_small = 0
    all_users = User.all
    @users = Array.new
    all_users.each do |user|
      if user.tshirt_size
        if user.tshirt_size == "small"
          total_small += 1
        elsif user.tshirt_size == "medium"
               total_medium += 1
        else
        total_large+= 1
        end
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