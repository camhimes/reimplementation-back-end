class Administrator < User
  def managed_users
    # Get all users that belong to an institution of the loggedIn user except the user itself
    ExpertizaLogger.warn LoggerMessage.new('Administrator Model', session[:user].name, "User #{session[:user].name} fetched all users.")
    User.where(institution_id:).where.not(id:)
  end
end
