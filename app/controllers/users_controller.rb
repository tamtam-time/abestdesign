class UsersController < ApplicationController

  def show
  user = User.find(params[:id])
  @name = user.name

  @designs = user.designs
  end



end
