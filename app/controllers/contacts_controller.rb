class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            flash[:success] = "Thank you for your message!"
            redirect_to new_contact_path
        else
            flash[:danger] = "Sorry error occured, message has not been sent."
            redirect_to new_contact_path
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :message)
        end
end