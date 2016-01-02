class PagesController < ApplicationController
    def index
        @contact = Contact.new
    end
    
    def create
       @contact = Contact.new(contact_params)
       
       respond_to do |format|
           if !@contact.save
               @error = "Cannot send message!"
           end
           format.js
       end
           
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :message)
        end
end
