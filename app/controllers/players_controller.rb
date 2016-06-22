class PlayersController < ApplicationController

skip_before_filter :verify_authenticity_token

  def show
    player = User.find(params[:id]) #params[:id] - hard coded
    resources = Resource.where(team_id: player.team_id)

    coach = User.find_by("team_id = ? AND coach = ?", player.team_id, true)
    coach_calendar = coach.get_user_schedule
    player_calendar = player.get_user_schedule
    grades = player.grades


    data = {
      team_id: player.team_id,
      name: player.full_name,
      resources: resources,
      coach_calendar: coach_calendar,
      player_calendar: player_calendar,
      grades: grades,
      notifications: player.get_player_notifications
    }


    render :json => data

  end
end


