require_relative './config/environment'
run ApplicationController
Figaro.application = Figaro::Application.new(
  environment: 'production',
  path: File.expand_path('config/application.yml')
)
Figaro.load
