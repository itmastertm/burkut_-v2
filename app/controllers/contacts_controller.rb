class ContactsController < ApplicationController
def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if verify_recaptcha(model: @contact) && @contact.deliver
		flash[:success] = t 'contacts.alert'
    else
     flash.now[:danger] = 'Не возможно отправить сообщение.'
      render :new
    end
  end
end
