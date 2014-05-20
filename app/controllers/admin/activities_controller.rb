class Admin::ActivitiesController < ApplicationController
	before_action :get_activity , only: [:show , :edit ,:update , :destroy]
	#before_action :authenticate , only: [ :new ,:create , :update , :edit , :destroy , :admin]


	def index
		#@activities_top_five = Activity.order("created_at DESC").first
		@activities = Activity.all.order("created_at DESC")

		respond_to do |format|
			format.html {render :action => 'index'}
			format.json {render :json => @activities.to_json(:methods => [:image_url , :link_url]) }
		end
		#format.json { render }
	end

	def show
		#@activity = Activity.find(params[:id])
	end


	def new

		@activity = Activity.new	
		@categories = Category.all
	end



	def create

		@activity = Activity.new(activity_params)
		@activity.category_ids = params[:category_ids]
		
		if(@activity.save)
			redirect_to admin_activities_path

		else
			render :new
		end



		#@category = Category.where( :order => activity_params[:category]).first
#
		#if(@category)
		#	@activity = @category.activities.build(activity_params)
		#	
		#	if(@activity.save)
		#		redirect_to activities_path					
		#	else
		#		render :new
		#	end
		#	#ActivityCategoryship.create(:activity => @activity , :category => category)
		#end

		#redirect_to activities_admin_path
		
		#else
		#	render :new
		#end
		
	end

	def edit	
		#@activity = Activity.find(params[:id])
		@categories = Category.all	
	end


	def update
		#@activity = Activity.find(params[:id])

		if(params[:category_ids].nil?)
			params[:category_ids]=[]
		end

		@activity.category_ids = params[:category_ids]
	  if(@activity.update(activity_params))
	  	redirect_to admin_activities_path
		else
			render :edit
		end
	
	end

	def destroy
		#@activity = Activity.find(params[:id])

		if(@activity.destroy)
		  redirect_to admin_activities_path
		else
		end

		
	end

 	
	#protected
#
	#	def authenticate
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == "" && password == ""
  #   end
  #  end


	private

		def get_activity
			@activity = Activity.find(params[:id])	
		end

		def activity_params
			params.require(:activity).permit(:title , :content , :location  , :date , :priority , :image  )
		end

end



#problem

#1. 為何不能用 .build + @activity.save ????????????
#2. @activity.category_ids = params[:category_ids]
