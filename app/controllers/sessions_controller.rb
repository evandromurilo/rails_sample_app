class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user == nil
            flash.now[:danger] = "Email not found."
            render 'new'
        elsif !user.authenticate(params[:session][:password])
            flash.now[:danger] = "Wrong password."
            render 'new'
        else
            flash[:success]= "Nice!"
            redirect_to user
        end

    end

    def destroy
    end
end
