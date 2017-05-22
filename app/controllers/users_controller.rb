class UsersController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update]
    before_action :correct_user, only: [:edit, :update]

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to the Sample App"
            log_in @user
            redirect_to @user
        else
            render 'new'
        end
    end

    def settings
        @user = current_user
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        # current_user.update_attribute(:animal, user_params[:animal])
        # redirect_to settings_path

        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "Profile updated"
            redirect_to @user
        else
            render 'edit'
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password,
                                         :password_confirmation, :animal)
        end

        # before filters
        
        # confirms a logged-in user
        def logged_in_user
            unless logged_in?
                store_location
                flash[:danger] = "Please log in."
                redirect_to login_url
            end
        end

        # confirms the correct user
        def correct_user
            @user = User.find(params[:id])
            redirect_to(root_url) unless current_user?(@user)
        end
end
