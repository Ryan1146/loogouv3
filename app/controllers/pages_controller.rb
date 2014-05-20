class PagesController < ApplicationController
	def home
		#@categories = Category.all
	
		@categories = Category.all
		@kinds = Kind.all
		#@articles = Article.all.order("created_at DESC") 
		@articles = Article.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
		#@pins = Pin.all.order("created_at DESC").paginate(:page => params[:page])
		@articles_top_five = Article.all.order("created_at DESC").limit(5)
	end

	


end
