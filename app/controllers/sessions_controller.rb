class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(email: params[:session][:email].downcase)
        if @user.nil?
            flash.now[:danger] = "Email not found."
            render 'new'
        elsif !@user.authenticate(params[:session][:password])
            flash.now[:danger] = "Wrong password."
            render 'new'
        else
            flash[:success]= "Nice!"
            log_in @user
            params[:session][:remember_me] == '1' ? remember(@user) : 
                forget(@user)
            redirect_to @user
        end
    end

    def destroy
        log_out if logged_in?
        redirect_to root_url
    end
end
