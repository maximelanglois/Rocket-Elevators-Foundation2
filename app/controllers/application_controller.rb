class ApplicationController < ActionController::Base
    before_action :set_lead
    def set_lead 
    @lead = Lead.new 
end
end
