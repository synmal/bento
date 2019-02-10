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
            user.feed
            UserMailer.newsletter(user).deliver_now
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
        # ––– Beginner
        if params[:programming_level] == 'ruby beginner'
            # If user is already a beginner, delete corresponding key value pair
            if (current_user.user_languages_skill.assoc('ruby').to_json.html_safe == ['ruby','beginner'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'ruby' && value == 'beginner'}
                current_user.save
                render json:{"user" => "deleted ruby beginner"}
            # If user is already intermediate, delete existing key value pair and replace with 'ruby' => 'beginner'
            elsif (current_user.user_languages_skill.assoc('ruby').to_json.html_safe == ['ruby','intermediate'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'ruby' && value == 'intermediate'}
                current_user.user_languages_skill.store("ruby", "beginner")
                current_user.save
                render json:{"user" => "change to ruby, intermediate"}
            # If no key pair value with key 'ruby'
            else
                current_user.user_languages_skill.store("ruby", "beginner")
                current_user.save
                render json:{"user" => "new ruby, beginner"} 
            end
        # ––– Intermediate
        elsif params[:programming_level] == 'ruby intermediate'
            # If user is already a intermediate, delete corresponding key value pair
            if (current_user.user_languages_skill.assoc('ruby').to_json.html_safe == ['ruby','intermediate'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'ruby' && value == 'intermediate'}
                current_user.save
                render json:{"user" => "deleted ruby intermediate"}
            # If user is already beginner, delete existing key value pair and replace with 'ruby' => 'beginner'
            elsif (current_user.user_languages_skill.assoc('ruby').to_json.html_safe == ['ruby','beginner'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'ruby' && value == 'beginner'}
                current_user.user_languages_skill.store("ruby", "beginner")
                current_user.save
                render json:{"user" => "change to ruby, beginner"}
            # If no key pair value with key 'ruby'
            else
                current_user.user_languages_skill.store("ruby", "intermediate")
                current_user.save
                render json:{"user" => "new ruby, intermediate"} 
            end
        # ––– Clear
        elsif params[:programming_level] == 'ruby clear'
            current_user.user_languages_skill.delete("ruby")
            current_user.save
            render json:{"user" => "ruby cleared"} 
        end
    # –––––––––––– Javascript –––––––––––––
        # ––– Beginner
        if params[:programming_level] == 'javascript beginner'
        # If user is already a beginner, delete corresponding key value pair
            if (current_user.user_languages_skill.assoc('javascript').to_json.html_safe == ['javascript','beginner'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'javascript' && value == 'beginner'}
                current_user.save
                render json:{"user" => "deleted javascript beginner"}
        # If user is already intermediate, delete existing key value pair and replace with 'ruby' => 'beginner'
            elsif (current_user.user_languages_skill.assoc('javascript').to_json.html_safe == ['javascript','intermediate'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'javascript' && value == 'intermediate'}
                current_user.user_languages_skill.store("javascript", "beginner")
                current_user.save
                render json:{"user" => "change to javascript, intermediate"}
        # If no key pair value with key 'javascript'
            else
                current_user.user_languages_skill.store("javascript", "beginner")
                current_user.save
                render json:{"user" => "new javascript, beginner"} 
            end
        # ––– Intermediate
        elsif params[:programming_level] == 'javascript intermediate'
            # If user is already a intermediate, delete corresponding key value pair
            if (current_user.user_languages_skill.assoc('javascript').to_json.html_safe == ['javascript','intermediate'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'javascript' && value == 'intermediate'}
                current_user.save
                render json:{"user" => "deleted javascript intermediate"}
            # If user is already beginner, delete existing key value pair and replace with 'ruby' => 'beginner'
            elsif (current_user.user_languages_skill.assoc('javascript').to_json.html_safe == ['javascript','beginner'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'javascript' && value == 'beginner'}
                current_user.user_languages_skill.store("javascript", "beginner")
                current_user.save
                render json:{"user" => "change to javascript, beginner"}
            else
                current_user.user_languages_skill.store("javascript", "intermediate")
                current_user.save
                render json:{"user" => "new javascript, intermediate"} 
            end
        # ––– Clear 
        elsif params[:programming_level] == 'javascript clear'
            current_user.user_languages_skill.delete("javascript")
            current_user.save
            render json:{"user" => "javascript cleared"} 
        end
    # –––––––––––– Python –––––––––––––
        # ––– Beginner
        if params[:programming_level] == 'python beginner'
            # If user is already a beginner, delete corresponding key value pair
            if (current_user.user_languages_skill.assoc('python').to_json.html_safe == ['python','beginner'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'python' && value == 'beginner'}
                current_user.save
                render json:{"user" => "deleted python beginner"}
            # If user is already intermediate, delete existing key value pair and replace with 'ruby' => 'beginner'
            elsif (current_user.user_languages_skill.assoc('python').to_json.html_safe == ['python','intermediate'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'python' && value == 'intermediate'}
                current_user.user_languages_skill.store("python", "beginner")
                current_user.save
                render json:{"user" => "change to python, intermediate"}
            # If no key pair value with key 'python'
            else
                current_user.user_languages_skill.store("python", "beginner")
                current_user.save
                render json:{"user" => "new python, beginner"} 
            end
        # ––– Intermediate
        elsif params[:programming_level] == 'python intermediate'
            # If user is already a intermediate, delete corresponding key value pair
            if (current_user.user_languages_skill.assoc('python').to_json.html_safe == ['python','intermediate'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'python' && value == 'intermediate'}
                current_user.save
                render json:{"user" => "deleted python intermediate"}
            # If user is already beginner, delete existing key value pair and replace with 'ruby' => 'beginner'
            elsif (current_user.user_languages_skill.assoc('python').to_json.html_safe == ['python','beginner'])
                current_user.user_languages_skill.delete_if {|key,value| key == 'python' && value == 'beginner'}
                current_user.user_languages_skill.store("python", "beginner")
                current_user.save
                render json:{"user" => "change to python, beginner"}
            else
                current_user.user_languages_skill.store("python", "intermediate")
                current_user.save
                render json:{"user" => "new python, intermediate"}
            end
        # ––– Clear
        elsif params[:programming_level] == 'python clear'
            current_user.user_languages_skill.delete("python")
            current_user.save
            render json:{"user" => "python cleared"} 
        end
    end

    def update_user_developer_type
        if  params[:developer_type] == 'front end'
            if current_user.developer_type.include?('front end')
                current_user.developer_type.delete('front end')
                current_user.save
                render json:{"developer_type" => "removed front end"}
            else
                current_user.developer_type << 'front end'
                current_user.save
                render json:{"developer_type" => "added front end"}  
            end
        end

        if  params[:developer_type] == 'back end'
            if current_user.developer_type.include?('back end')
                current_user.developer_type.delete('back end')
                current_user.save
                render json:{"developer_type" => "removed back end"}
            else
                current_user.developer_type << 'back end'
                current_user.save
                render json:{"developer_type" => "added back end"}  
            end
        end

        if  params[:developer_type] == 'full stack'
            if current_user.developer_type.include?('full stack')
                current_user.developer_type.delete('full stack')
                current_user.save
                render json:{"developer_type" => "removed full stack"}
            else
                current_user.developer_type << 'full stack'
                current_user.save
                render json:{"developer_type" => "added full stack"}  
            end
        end

        if  params[:developer_type] == 'mobile'
            if current_user.developer_type.include?('mobile')
                current_user.developer_type.delete('mobile')
                current_user.save
                render json:{"developer_type" => "removed mobile"}
            else
                current_user.developer_type << 'mobile'
                current_user.save
                render json:{"developer_type" => "added mobile"}  
            end
        end     
    end

    def update_user_current_interest
        # Progressive Web Apps
        if  params[:interest] == 'progressive web apps'
            if current_user.interest.include?('progressive web apps')
                current_user.interest.delete('progressive web apps')
                current_user.save
                render json:{"interest" => "removed progressive web apps"}
            else
                current_user.interest << 'progressive web apps'
                current_user.save
                render json:{"interest" => "added progressive web apps"}  
            end
        end
        # Chatbot
        if  params[:interest] == 'chatbot'
            if current_user.interest.include?('chatbot')
                current_user.interest.delete('chatbot')
                current_user.save
                render json:{"interest" => "removed chatbot"}
            else
                current_user.interest << 'chatbot'
                current_user.save
                render json:{"interest" => "added chatbot"}  
            end
        end
        # Cybersecurity
        if  params[:interest] == 'cybersecurity'
            if current_user.interest.include?('cybersecurity')
                current_user.interest.delete('cybersecurity')
                current_user.save
                render json:{"interest" => "removed cybersecurity"}
            else
                current_user.interest << 'cybersecurity'
                current_user.save
                render json:{"interest" => "added cybersecurity"}  
            end
        end
        # Motion UI
        if  params[:interest] == 'motion ui'
            if current_user.interest.include?('motion ui')
                current_user.interest.delete('motion ui')
                current_user.save
                render json:{"interest" => "removed motion ui"}
            else
                current_user.interest << 'motion ui'
                current_user.save
                render json:{"interest" => "added motion ui"}  
            end
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
