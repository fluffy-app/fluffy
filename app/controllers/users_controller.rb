class UsersController < ApplicationController
  def mypage
    @user = User.find(params[:id])
  end
end
