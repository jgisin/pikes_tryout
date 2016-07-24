class ContactsController < ApplicationController

  def step_two
    @primary_contact = Player.find(params[:player_id]).contacts.build
    @primary_contact.contact_type = "0"
  end

  def step_three
    @secondary_contact = Player.find(params[:player_id]).contacts.build
    @secondary_contact.contact_type = "1"
  end

  def payment
  end

  def create
    @contact = Player.find(params[:contact][:player_id]).contacts.build(contact_params)
    @contact.save
    if params[:contact][:contact_type] == "0"
      redirect_to step_three_path(player_id: params[:contact][:player_id])
    else
      @contact.player.send_mail
      redirect_to payment_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:contact_type, :first_name, :last_name, :email, :address, :city, :state, :zip, :home_phone, :cell_phone)
  end

end
