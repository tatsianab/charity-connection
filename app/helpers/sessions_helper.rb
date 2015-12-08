module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def log_out
        session.delete(:user_id)
        session.delete(:cart_id)
        session.clear
        current_cart = nil
        current_user = nil
    end

    def current_user
        
        if !User.find_by(id: session[:user_id])
            @current_user = GoogleOmniauthTable.find_by(uid: session[:user_id])
        else
          @current_user = User.find_by(id: session[:user_id])
        end
        # @current_user ||= User.find_by(id: session[:user_id])
        @current_user
    end

    def logged_in?
        !current_user.nil?
    end

    def require_login
      unless logged_in? && params[:id] == session[:user_id].to_s
        flash[:error] = "You must be logged as this user to complete this action"
        redirect_to '/login'
      end
    end

    def valid_charity?
      if Charity.where(user_id: session[:user_id]).empty?
        flash[:notice] = "You must be logged in as a Charity to order an item"
        redirect_to '/login'
      end
    end

    def valid_business?
      if Business.where(user_id: session[:user_id]).empty?
        flash[:notice] = "You must be logged in as a Business to list an item"
        redirect_to '/login'
      end
    end

end
