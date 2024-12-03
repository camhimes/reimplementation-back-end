class TeamsUser < ApplicationRecord
  belongs_to :user
  belongs_to :team

  def name(ip_address = nil)
    name = user.name(ip_address)
  end

  def get_team_members(team_id)
    team_members = TeamsUser.where('team_id = ?', team_id)
    user_ids = team_members.pluck(:user_id)
    users = User.where(id: user_ids)
    ExpertizaLogger.info LoggerMessage.new("Team Users Model", session[:user].name,
                                           "User #{session[:user].name} fetched the members of team #{team_id}.",)

    return users
  end

  # Removes entry in the TeamUsers table for the given user and given team id
  def self.remove_team(user_id, team_id)
    team_user = TeamsUser.where('user_id = ? and team_id = ?', user_id, team_id).first
    team_user&.destroy
    ExpertizaLogger.info LoggerMessage.new("Team User Model", session[:user].name,
                                           "User#{session[:name].name} removed user #{user_id} from team #{team_id}.")

  end

end
