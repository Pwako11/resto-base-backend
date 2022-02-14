class Api::V1::SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:session][:username])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            signed_in = UserSerializer.new(@user).serializable_hash.to_json
            
            puts signed_in

            render json: signed_in
        else
            render json: {
                error: "Invalid credentials"
            }
        end
    end 
    
    def get_current_user
        if logged_in?
            puts current_user
                current_session = UserSerializer.new(current_user).serializable_hash.to_json
                
                puts current_session  

                render json: current_session
        else 
            render json: {
                error: "No user sessions logged"
            }
        end 
    end 

    def destroy
        session.clear

        render json: {
            notice: "You are signed out"
        }
    end 
end
