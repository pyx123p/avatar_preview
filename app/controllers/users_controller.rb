class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
  end

  def avatar_preview
    return unless params[:image].present?
    @avatar = User.set_avatar_path(params[:image])
  end
end
