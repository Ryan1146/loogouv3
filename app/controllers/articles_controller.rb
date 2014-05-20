class ArticlesController < ApplicationController
  before_action :get_article , only: [:show]
  
  def index
    #@activities_top_five = Activity.order("created_at DESC").first
    @articles = Article.all.order("created_at DESC")

    respond_to do |format|
      format.html {render :action => 'index'}
      format.json {render :json => @articles.to_json(:methods => [:image_url , :link_url]) }
    end
    #format.json { render }
  end


  def show
    #@activity = Activity.find(params[:id])

  end


  private

    def get_article
      @article = Article.find(params[:id])  
    end
    

end
