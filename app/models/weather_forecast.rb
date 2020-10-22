class WeatherForecast
  def self.remote_ip(ip)
    if ip == '127.0.0.1'
      '93.185.29.95'
    else
      ip
    end
  end

  def self.get_data_ip(remote_ip)
    url = 'https://api.ipgeolocation.io/ipgeo?apiKey=' +
          Figaro.env.ipgeo_key +
          '&ip=' +
          remote_ip +
          '&lang=en&fields=*&excludes='
    response = Typhoeus::Request.get(url, followlocation: true)
    JSON.parse(response.body)
  end

  def self.get_wwo_data(latlon)
    url = 'https://api.worldweatheronline.com/premium/v1/weather.ashx?key=' +
          Figaro.env.key_wwo +
          '&num_of_days=4&' +
          latlon
    Nokogiri::XML(URI.open(url))
  end
end
