module UserAuthentication
  def current_user
    return nil if session[:user_id].nil?
    @current_user ||= UserRepository.new.find(session[:user_id])
  end

  def authenticate!
    redirect_to '/' unless current_user
  end
end
