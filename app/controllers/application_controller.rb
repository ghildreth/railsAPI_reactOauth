class ApplicationController < ActionController::API
    # include ActionController::RequestForgeryProtection
    # before_action :skip_session
    # protect_from_forgery with: :exception
    # protect_from_forgery unless: -> { request.format.json? }
    # , unless: -> { request.format.json? }
    # helper_method :current_user
  
    def authenticate
        redirect_to :login unless user_signed_in?
    end
  
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def user_signed_in?
        # converts current_user to a boolean by negating the negation
        !!current_user
    end
     ## Skip sessions and cookies for Rails API
    def skip_session
        request.session_options[:skip] = true
    end
end
