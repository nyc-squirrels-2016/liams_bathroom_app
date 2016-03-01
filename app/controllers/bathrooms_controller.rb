class BathroomsController < ApplicationController
  def index
    @bathrooms = Bathroom.all
  end

  def new
    if request.xhr?
      @bathroom = Bathroom.new
      render :new, layout: false, locals: {bathroom: @bathroom}
    else
      @bathroom = Bathroom.new
    end
  end

  def create
    if request.xhr?
      if logged_in?
        @bathroom = Bathroom.new(bathroom_params)
        @bathroom.user_id = session[:user_id]
        if @bathroom.save
          render partial: 'bathroom', layout: false, locals: {bathroom: @bathroom}
        else
          render text: "You filled out the form incorrectly", status: 400
        end
      else
        render text: "You need to login", status: 400
      end
    else
      if logged_in?
        @bathroom = Bathroom.new(bathroom_params)
        @bathroom.user_id = session[:user_id]
        if @bathroom.save
          redirect_to root_path
        else
          render :new
        end
      else
        redirect_to '/login'
      end
    end
  end

  def show
    @bathroom = Bathroom.find(params[:id])
  end

  def edit
    @bathroom = Bathroom.find(params[:id])
    unless @bathroom.user.id == session[:user_id]
      redirect_to "/login"
    end
  end

  def update
    @bathroom = Bathroom.find(params[:id])
    if logged_in? && @bathroom.user.id == current_user.id
      if @bathroom.update(bathroom_params)
        redirect_to bathroom_path(@bathroom)
      else
        render :new
      end
    else
      redirect_to '/login'
    end
  end

  def destroy
    @bathroom = Bathroom.find(params[:id])
    if logged_in? && @bathroom.user.id == current_user.id
      @bathroom.destroy
      redirect_to root_path
    else
      redirect_to '/login'
    end
  end

  private
  def bathroom_params
    params.require(:bathroom).permit(:location, :author_rating, :description, :picture_url)
  end
end
