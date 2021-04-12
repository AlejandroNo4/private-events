class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
    @events = @user.created_events
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Signed up successfully!'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
