module SessionsHelper
  def log_in(user)
    session[:creator_id] = user.id
  end

  def current_user
    if session[:creator_id]
      @current_user ||= User.find_by(id: session[:creator_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:creator_id)
    @current_user = nil
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end
