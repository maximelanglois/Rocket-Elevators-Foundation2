class Address < ApplicationRecord
    has_many :customers
    has_one :building

    require 'faraday'
    $gmap_key = Rails.application.credentials.gmap[:key]
    after_create :make_url, :get_lat_lng 

    def make_url
        $url_address = number_and_street.gsub(' ', '+')
        $url_city = city.gsub(' ', '+')
    end

    def get_lat_lng
        gmap_json = Faraday.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{$url_address},+#{$url_city}&key=#{$gmap_key}"
        parsed_gmap_response = JSON.parse(gmap_json.body)
        request_status = parsed_gmap_response['status']
        if request_status == "OK"
            gmap_lat = parsed_gmap_response['results'].reduce({}, :merge)['geometry']['location']['lat']
            gmap_lng = parsed_gmap_response['results'].reduce({}, :merge)['geometry']['location']['lng']
            address = Address.last
            address.update_attributes(:lat => gmap_lat)
            address.update_attributes(:lng => gmap_lng)
        end
    end   

end
