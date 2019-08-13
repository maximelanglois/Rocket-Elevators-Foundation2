class LeadsController < ApplicationController
    def index
    end

    def show
        @lead = Lead.find(params[:id])
    end

    def new
      @lead = Lead.new
    end

    def create
      if verify_recaptcha(model: @lead)
      @lead = Lead.new(lead_params)
      @lead.creation_date = DateTime.now
      ZendeskAPI::Ticket.create!($client, 
        :subject => "**NEW LEAD** #{params['lead'][:full_name]} from #{params['lead'][:company_name]}",
        :comment => "The contact #{params['lead'][:full_name]} from company #{params['lead'][:company_name]} can be reached at email 
        #{params['lead'][:email]} and at phone number #{params['lead'][:phone]}. #{params['lead'][:department]} has a project named 
        #{params['lead'][:project_name]} which would require contribution from Rocket Elevators.
        \nProject description:\n#{params['lead'][:project_description]} \n\n Message:\n #{params['lead'][:message]}",
        :priority => "urgent",
        :type => "question")

      if @lead.save
        LeadNotifierMailer.send_lead_email(@lead).deliver
        flash[:success] = "New lead received"
        render 'static_pages/message_sent'
        
        
      end
    end
  end

    def lead_params
      params.require(:lead).permit(:full_name, :email, :phone,:company_name,:department,:project_name,:project_description, :message, :attachment_file)
    end
end
