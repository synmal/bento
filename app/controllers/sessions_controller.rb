class SessionsController < Clearance::SessionsController
    # create new session when user signs up/in
    def create
        @user = authenticate(params)
    
        sign_in(@user) do |status|
          if status.success?
            # if sign in successful, redirect to the user profile
            redirect_to user_path(@user.id)
          else
            flash.now.notice = status.failure_message
            render template: "sessions/new", status: :unauthorized
          end
        end
    end
end
