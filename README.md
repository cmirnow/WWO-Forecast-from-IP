## World Weather Online Forecast from IP on Sinatra

[Demo](https://masterpro.herokuapp.com/wwo/weather).

How to start:
```bash
git clone https://github.com/cmirnow/WWO-Forecast-from-IP.git
cd WWO-Forecast-from-IP
bundle install
bundle exec figaro install
```
Enter the API access keys (WorldWeatherOnline.com && IPgeolocation.io) in the file application.yml:

```bash
key_wwo: "*************************"
ipgeo_key: "**************************"
```
Then:

```bash
bundle exec shotgun
```
...and go to http://localhost:9393

