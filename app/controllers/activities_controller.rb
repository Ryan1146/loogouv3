class ActivitiesController < ApplicationController
	before_action :get_activity , only: [:show , :edit ,:update , :destroy]
	

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

		
	end




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
