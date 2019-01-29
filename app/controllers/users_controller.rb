class UsersController < Clearance::UsersController
    before_action :set_user, except: [:create, :index]

    def create
        # Create new user instance
        user = User.new(user_params)
        # if user is valid, redirect to edit their information
        if user.save
            redirect_to edit_user_path(user.id)
        else
        # otherwise, go back to the sign up form
            render 'new'
        end
    end

    def show
    end
    
    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :programming_level, :programming_languages, :developer_type, :interest)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
