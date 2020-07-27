class UserController < ApplicationController
  def index
    @users = User::Operation::Index.(params: {is_valid: true})
    render json: @users
  end

  def show
    @user = User::Operation::Show.(params: {id: 1})
    render json: @user
  end

end
