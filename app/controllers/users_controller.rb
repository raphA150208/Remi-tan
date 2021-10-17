class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    # if current_user == @user
      @user = User.find(params[:id])
    # else
    #   redirect_to user_path(current_user.id), alert: '他の人のマイページは見られません！'
    # end
  end

end