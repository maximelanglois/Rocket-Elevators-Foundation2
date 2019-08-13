
namespace :db_task do
    task :rebuild, [] => :environment do
  
      Rake::Task['db:drop'].execute
      Rake::Task['db:create'].execute
      Rake::Task['db:migrate'].execute
      Rake::Task['db:seed'].execute
    end


    require 'faraday'
    $gmap_key = Rails.application.credentials.gmap[:key]

    task :lat_lng, [] => :environment do
      Address.all.each do |a|
          if !a.lat || !a.lng
              url_address = a.number_and_street.gsub(' ', '+')
              url_city = a.city.gsub(' ', '+')
              gmap_url = "#{url_address},#{url_city}"
              gmap_json = Faraday.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{gmap_url}&key=#{$gmap_key}"
              parsed_gmap_response = JSON.parse(gmap_json.body)
              request_status = parsed_gmap_response['status']
              if request_status == "OK"
                lat = parsed_gmap_response['results'].reduce({}, :merge)['geometry']['location']['lat']
                lng = parsed_gmap_response['results'].reduce({}, :merge)['geometry']['location']['lng']
                a.lat = lat
                a.lng = lng
                a.save!
              end
          end
      end
    end
end

