module SessionsHelper
    def current_user
        if session[:userid]
            @current_user = User.find(session[:userid].to_i)
        else
            redirect_to login_path
        end
    end
end
