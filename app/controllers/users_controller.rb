class UsersController < ApplicationController
  def show
    @user = current_user
    @notes = @user.notes
  end
end
