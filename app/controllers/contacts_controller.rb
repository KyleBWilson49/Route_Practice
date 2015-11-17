class ContactsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    render json: user.contacts + user.shared_contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
        render(
        json: contact.errors.full_messages, status: :unprocessable_entity
        )
    end
  end

  def show
    contact = Contact.find_by(id: params[:id])
    render json: contact
  end

  def update
    contact = Contact.find_by(id: params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    if contact.destroy
      render json: contact
    else
      render json: "Cannot Destroy!"
    end
  end

  def favorite_contacts
    user = User.find_by(id: params[:user_id])
    contact = user.contacts.where(favorite_contacts = true)
  end

  private
  def contact_params
    params.require(:contacts).permit(:name, :email, :user_id)
  end


end
