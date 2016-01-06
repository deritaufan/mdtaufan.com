class PagesController < ApplicationController
    def index
    end
    
    def create
        name  = params[:name]
        email = params[:email]
        message = params[:message]
        create_contact = Contact.create(name: name, email: email, message: message)
        if create_contact.valid?
            ContactMailer.contact_email(name, email, message).deliver
            html = render_to_string :partial => 'contact_response', :locals => {:create_contact => create_contact}
            respond_to do |format|
                format.json { render :json => {:success => true, :html => html} }
            end
        end
    end
end
