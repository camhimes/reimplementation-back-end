class Instructor < User

  # Get all users whose parent is the instructor
  def managed_users
    ExpertizaLogger.info LoggerMessage.new("Instructor Model", session[:user].name,
                                           "User #{session[:name].name} found all instructors with parent ID #{id}.")
    User.where(parent_id: id).to_a
  end


end
