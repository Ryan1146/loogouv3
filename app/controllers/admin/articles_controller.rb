class Admin::ArticlesController < ApplicationController
	before_action :get_article , only: [:show , :edit , :update ,:destroy]
	#before_action :authenticate , only: [ :new ,:create , :update , :edit , :destroy , :admin]
	


	def index
		
		@articles = Article.all.order("created_at DESC")

		respond_to do |format|
			format.html {render :action => 'index'}
			format.json {render :json => @articles.to_json(:methods => [:image_url , :link_url]) }
		end
	end

	def show
	end


	def new
		@article = Article.new
		@kinds = Kind.all
	end



	def create
		@article = Article.new(article_params)
		@article.kind_ids = params[:kind_ids]

		if(@article.save)
			redirect_to  admin_articles_path
		else
			render :new
		end
	end



	def edit
		@kinds = Kind.all
	end


	def update

		if(params[:kind_ids].nil?)
			params[:kind]=[]
		end

		@article.kinds_ids = params[:article_ids]

		if(@article.update(article_params))
			redirect_to admin_articles_path
		else 
			render :edit
		end
	end


	def destroy
		#@activity = Activity.find(params[:id])
	

		if(@article.destroy)
		  redirect_to admin_articles_path
		else
		end

		
	end




	#protected	
	#	def authenticate
	#     authenticate_or_request_with_http_basic do |username, password|
	#       username == "" && password == ""
	#     end
  #  end

  private


  	def get_article
  		@article = Article.find(params[:id])
  	end

  	def article_params
  		params.require(:article).permit(:title , :content , :author , :source , :date ,:priority , :image )
  	end



end
