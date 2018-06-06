class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

    def create
      @contact = Contact.new(params[:contact])
      @contact.request = request
      if @contact.deliver
        redirect_to root_path, notice: "We will get in touch soon"
        flash.now[:error] = nil
      else
        flash.now[:error] = 'cannot send message.'
        render :new
      end
    end
end
