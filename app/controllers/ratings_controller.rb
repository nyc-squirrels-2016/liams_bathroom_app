class RatingsController < ApplicationController
  def create
    @bathroom = Bathroom.find(params[:bathroom_id])
    if logged_in?
      if @bathroom.has_not_been_rated_by_user(current_user.id)
        rating = @bathroom.ratings.new(number: params[:rating][:number])
        rating.user_id = session[:user_id]
        if rating.save
          redirect_to bathroom_path(@bathroom)
        else
          redirect_to bathroom_path(@bathroom)
        end
      else
        redirect_to bathroom_path(@bathroom)
      end
    else
      redirect_to '/login'
    end
  end
end
