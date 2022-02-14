class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    serializedUsers = UserSerializer.new(@users).serializable_hash.to_json

    render json: serializedUsers
  end

  # GET /users/1
  def show
    serializedUser = UserSerializer.new(@user).serializable_hash.to_json
    render json: serializedUser
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      user_json = UserSerializer.new(@user).serializable_hash.to_json
      render json: user_json, status: :created
    else
      error_resp = {
        error: @user.errors.full_message.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      serializedUser = UserSerializer.new(@user).serializable_hash.to_json
      render json: serializedUser
    else
      error_resp = {
        error: @user.errors.full_message.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :username, :email, :password_digest)
    end
end
