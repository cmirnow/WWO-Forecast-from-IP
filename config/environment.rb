require 'bundler/setup'
require 'rubygems'
require 'bundler'
require 'sinatra/static_assets'
APP_ENV = ENV['RACK_ENV'] || 'production'
Bundler.require :default, APP_ENV.to_sym
require_rel '../app'
