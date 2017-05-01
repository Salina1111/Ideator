class IdeasController < ApplicationController
	def index
		@ideas = Idea.all.paginate(:page =>params[:page], :per_page =>10)
	end

	def edit
  	@idea = Idea.find(params[:id])
	end

	def create
    @idea = Idea.create(idea_params)
    if @idea.valid?
      flash[:notice] ="Your idea has been posted!"
    else
      flash[:alert]="Woops!Looks like there has been a error!"
    end
    redirect_to root_path
  end

    def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
    flash[:success]="The idea has been updated!"
    redirect_to root_path
    else
    flash[:success]="Woops! Looks like there has been an error!"
    redirect_to edit_idea_path(params[:id])
    end
  end


	def destroy
  		@idea = Idea.find(params[:id])
  		@idea.destroy
  		flash[:success]="The idea was successfully deleted!"
  		redirect_to root_path
	end
	def index
		@ideas = Idea.all.paginate(:page => params[:page], :per_page => 10)
	end
	
	private
	
	def idea_params
		params.require(:idea).permit(:description, :author)
	end
end