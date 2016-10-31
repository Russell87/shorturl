class ApplicationController < ActionController::Base
  require 'httparty'
  require 'nokogiri'

  protect_from_forgery with: :exception
end
