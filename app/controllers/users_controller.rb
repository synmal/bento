class UsersController < Clearance::UsersController
    before_action :set_user, except: [:create, :index]
    before_action :require_login, except: [:create, :new]

    def create
        # Create new user instance
        user = User.new(user_params)
        # if user is valid, redirect to edit their information
        if user.save
            sign_in(user)
            UserMailer.welcome_mail(user).deliver_now
            redirect_to edit_user_path(user.id)
        else
        # otherwise, go back to the sign up form
            redirect_to root_path
            flash[:notice] = 'Unauthorized'
        end
    end

    def show
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end
    
    def destroy
        @user.destroy
        redirect_to :root,
        notice: 'User was successfully destroyed.'
    end

    def update_programming_level
        # user byebug
        if params[:programming_level] == "0"
            current_user.beginner!
            render json:{current_user => 'beginner'}
        else
            current_user.intermediate!
            render json:{current_user => 'intermediate'}
        end 
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :programming_level, {programming_languages: []}, {developer_type: []}, {interest: []}, :avatar)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
