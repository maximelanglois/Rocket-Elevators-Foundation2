class Quote < ApplicationRecord

    after_create :zendesk_quote

    def zendesk_quote
        ZendeskAPI::Ticket.create!($client, 
            :subject => "**NEW QUOTE** #{id} from #{company_name}",
            :comment => "Company #{company_name} can be reached at email #{email}.   
            \n\n* Project Type: #{project_type} * Product Range: #{product_range} * Shafts required: #{shafts_required} * Total cost: #{total_cost}",
            :priority => "urgent",
            :type => "task")
    end


#{id}
end
