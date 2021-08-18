class UserController < ApplicationController
  def edit 
   @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to :root
    else
      render action :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name).merge(user: current_user)
    end

end
