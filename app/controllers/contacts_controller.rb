class ContactsController < ApplicationController

  def step_two
    @primary_contact = Contact.new(contact_type: 0)
  end

  def step_three
    @secondary_contact = Contact.new(contact_type: 1)
  end

  def payment
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      if @contact.contact_type == 0
        redirect_to step_three_path
      else
        redirect_to payment_path
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :address, :city, :state, :zip, :home_phone, :cell_phone)
  end

end
