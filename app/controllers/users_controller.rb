class UsersController < ApplicationController

  def mypage
    @user = User.find(params[:id])
  end

  def mypage_list
    @user = User.find(params[:id])
  end

end
