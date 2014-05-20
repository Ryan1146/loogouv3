class CategoriesController < ApplicationController

	before_action :get_category , only: [:show]

	def show

		@categories = Category.all
		@kinds = Kind.all
		#@activities = @category.activities

		@activities = @category.activities.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)

		#@category = Category.find(params[:id])
		#@activities = @category.activities
	end

  private
  	def get_category
			@category = Category.find(params[:id])
  	end


end
