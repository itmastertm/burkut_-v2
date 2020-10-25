class ContactsController < ApplicationController
def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
		flash.now[:success] = 'Спасибо за Ваше сообщение. Мы обязательно свяжемся с Вами в ближайшее время!'
    else
     flash.now[:error] = 'Не возможно отправить сообщение.'
      render :new
    end
  end
end
