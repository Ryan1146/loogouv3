class KindsController < ApplicationController

	before_action :get_kind , only: [:show]

	def show

		@kinds = Kind.all
		@articles = @kind.articles

		#@category = Category.find(params[:id])
		#@activities = @category.activities
	end

  private
  	def get_kind
			@kind = Kind.find(params[:id])
  	end



end
