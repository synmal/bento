class UsersController < Clearance::UsersController
    before_action :set_user, except: [:create, :index]
    before_action :require_login, except: [:create, :new]
    
    def create
        # Create new user instance
        user = User.new(user_params)
        # if user is valid, redirect to edit their information
        if user.save
            sign_in(user)
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

    def update_user_language_skill
        # –––––––––––– Ruby –––––––––––––
        if params[:programming_level] == 'ruby beginner'
            current_user.user_languages_skill.store("ruby", "beginner")
            current_user.save
            render json:{"user" => "ruby, beginner"}
        elsif params[:programming_level] == 'ruby intermediate'
            current_user.user_languages_skill.store("ruby", "intermediate")
            current_user.save
            render json:{"user" => "ruby, intermediate"}
        end
    
        # –––––––––––– Javascript –––––––––––––
        if params[:programming_level] == 'js beginner'
            current_user.user_languages_skill.store("js", "beginner")
            current_user.save
            render json:{"user" => "js, beginner"}
        elsif params[:programming_level] == 'js intermediate'
            current_user.user_languages_skill.store("js", "intermediate")
            current_user.save
            render json:{"user" => "js, intermediate"}
        end
    end

    def update_user_developer_type
        if  params[:developer_type] == 'front end'
            current_user.developer_type << 'front end'
            current_user.save
            render json:{"developer_type" => "front-end"}  
        end
        if  params[:developer_type] == 'back end'
            current_user.developer_type << 'back end'
            current_user.save
            render json:{"developer_type" => "back-end"}  
        end
    end

    def update_user_current_interest
        if  params[:current_interest] == 'progressive web apps'
            current_user.interest << 'progressive web apps'
            current_user.save
            render json:{"interest" => "progressive web apps"}  
        end
        if  params[:current_interest] == 'chatbot'
            current_user.interest << 'chatbot'
            current_user.save
            render json:{"interest" => "chatbot"}  
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :user_languages_skill, :developer_type, {developer_type: []}, :interest, {interest: []}, :avatar)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
