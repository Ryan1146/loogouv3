class KindsController < ApplicationController

	before_action :get_kind , only: [:show]

	def show

		@kinds = Kind.all
		@categories = Category.all
		#@articles = @kind.articles

		@articles = @kind.articles.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)

		#@category = Category.find(params[:id])
		#@activities = @category.activities
	end

  private
  	def get_kind
			@kind = Kind.find(params[:id])
  	end



end
