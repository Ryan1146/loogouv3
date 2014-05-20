class CategoriesController < ApplicationController

	before_action :get_category , only: [:show]

	def show

		@categories = Category.all
		@kind = Kind.all
		@activities = @category.activities

		#@category = Category.find(params[:id])
		#@activities = @category.activities
	end

  private
  	def get_category
			@category = Category.find(params[:id])
  	end


end
