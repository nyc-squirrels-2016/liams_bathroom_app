class BathroomsController < ApplicationController
  def index
    @bathrooms = Bathroom.all
    if params[:search]
      @bathrooms = Bathroom.search(params[:search]).order(created_at: :desc)
    end
  end

  def new
    @bathroom = Bathroom.new
  end

  def create
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

  def show
    @bathroom = Bathroom.includes(:comments).find(params[:id])
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
