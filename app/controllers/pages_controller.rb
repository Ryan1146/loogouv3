class PagesController < ApplicationController
	def home
		#@categories = Category.all
	
		@categories = Category.all
		@kinds = Kind.all
		@articles = Article.all.order("created_at DESC")
		@articles_top_five = Article.all.order("created_at DESC").limit(5)
	end

	


end
