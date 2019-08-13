class GmapController < ApplicationController

    gmap_key = Rails.application.credentials.gmap[:key]
    $gmap_url = "https://maps.googleapis.com/maps/api/js?key=#{gmap_key}&callback=initMap"

    def index
       @info_list =  []
       Building.all.each do |building|
        @location = []
        @building_location = building.address.number_and_street
        @location.push (@building_location)
        @building_contact = building.name_service_contact
        @location.push (@building_contact)
        @building_lat = building.address.lat
        @location.push (@building_lat)
        @building_lng = building.address.lng
        @location.push (@building_lng)
        @building_client_name = building.customer.business_name
        @location.push (@building_client_name)
        @building_num_of_batt = building.batteries.size
        @location.push (@building_num_of_batt)
        @building_num_of_floor = building.batteries.first.columns.first.served_floors
        @location.push (@building_num_of_floor)
        @building_num_of_col =  building.batteries.first.columns.size
        @location.push (@building_num_of_col)
        @building_num_of_el = building.batteries.first.columns.first.elevators.size
        @location.push (@building_num_of_el)
        @building_city = building.address.city
        @location.push (@building_city)
        @info_list.push (@location)

    
       end
    end
end
