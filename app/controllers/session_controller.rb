class SessionController < ApplicationController
    def new
    end

    def create
        username = params[:session][:name]
        user = User.find_by(name: username)
        if user
            session[:userid] = user.id
            redirect_to root_url
        else
            flash.now[:danger] = "#{username} does not exist"
            render 'new'
        end
    end

    def destroy
        session[:userid] = nil
        redirect_to login_path
    end
end
