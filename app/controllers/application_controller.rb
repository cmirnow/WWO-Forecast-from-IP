class ApplicationController < Sinatra::Base
  configure do
    set :views, 'app/views'
    set :public_dir, 'public'
  end

  register Sinatra::StaticAssets

  get '/' do
    ip = WeatherForecast.clients_ip(request.ip)
    location = WeatherForecast.get_data_ip(ip)
    coordinates = "&lat=#{location['latitude']}&lon=#{location['longitude']}"
    @data = WeatherForecast.get_wwo_data(coordinates)
    @time_scale = WeatherForecast.get_time_scale

    @location = location['latitude'], location['longitude']
    @region = location['city']
    @country = location['country_name']
    @country_code = location['country_code2']
    @timezone = location['time_zone']['name']
    @ip = ip

    erb :index
  end
end
