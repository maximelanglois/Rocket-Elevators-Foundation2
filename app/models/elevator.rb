class Elevator < ApplicationRecord
    include ActiveModel::Dirty
    belongs_to :customer, foreign_key: "customer_id"
    belongs_to :column, foreign_key: "column_id"

    before_update :get_old_status
    after_update :sms_status_change, :slack_status_change

   def get_old_status
        $old_status = self.status_was
    end
    
    def sms_status_change
        if (status == 'Intervention') && (status != $old_status)
        message = "The elevator #{id} status has changed to 'Intervention' and may need some maintenance."
        TwilioTextMessenger.new(message).call
        end
    end

    def slack_status_change
        if status != $old_status
        slack_timestamp = DateTime.now
        SlackNotifier::CLIENT.ping "The Elevator *#{id}* with  Serial Number *#{serial_number}* changed status from  *#{$old_status}* to  *#{status}*"
        end
    end

end
