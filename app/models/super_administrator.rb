class SuperAdministrator < User
  def managed_users
    ExpertizaLogger.info LoggerMessage.new("Super Administrator Model", session[:user].name,
                                           "User #{session[:user].name} retrieved all users.")
    User.all.to_a
  end
end