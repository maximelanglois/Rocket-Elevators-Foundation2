class TwilioTextMessenger
    attr_reader :message
  
    def initialize(message)
      @message = message
    end
  
    def call
      client = Twilio::REST::Client.new
      client.messages.create({
        from: Rails.application.credentials.twilio[:sms_phone],
        to: Rails.application.credentials.twilio[:service_phone],
        body: message
      })
      
    end
  end