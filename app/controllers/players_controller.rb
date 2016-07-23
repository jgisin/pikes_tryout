class PlayersController < ApplicationController

  def landing

  end

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @primary = @player.contacts.find_by(contact_type: 0)
    @secondary = @player.contacts.find_by(contact_type: 1)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to step_two_path(player_id: @player.id)
    end
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :dob, :present_team, :level)
  end
end
