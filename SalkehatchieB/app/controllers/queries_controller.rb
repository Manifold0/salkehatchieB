class QueriesController < ApplicationController
	def index
	end

	def campers_by_camp
		@camps = Camp.all
	end
end