class ApplicationController < Sinatra::Base
  configure do
    set :views, 'app/views'
    set :public_dir, 'public'
  end

  register Sinatra::StaticAssets

  get '/' do
    ip = WeatherForecast.remote_ip(request.ip)
    hash = WeatherForecast.get_data_ip(ip)
    latlon = "&lat=#{hash['latitude']}&lon=#{hash['longitude']}"
    @data = WeatherForecast.get_wwo_data(latlon)

    @location = hash['latitude'], hash['longitude']
    @region = hash['city']
    @country = hash['country_name']
    @country_code = hash['country_code2']
    @timezone = hash['time_zone']['name']
    @ip = ip

    erb :index
  end
end
