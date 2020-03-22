# coding: utf-8
require 'net/http'
require 'uri'
require 'rexml/document'
require 'dotenv/load'

class ApiRequest
  @@API_URL = ENV['API_URL']
  @@API_APP_KEY = ENV['API_APP_KEY']
  @@APP_APP_SECRET_KEY = ENV['API_APP_SECRET_KEY']

  # Common request param
  def common_param
    '?appkey=' + @@API_APP_KEY
  end

  # Api client
  def client
    uri = URI.parse(@@API_URL)
    client = Net::HTTP.new(uri.host, uri.port)
    client.use_ssl = true
    client
  end

  # Throw request and return xml document
  def request(method, path, params = nil)
    requestParam = params.nil? ? '' : '&' + params
    response = self.client.send_request(method, path, self.common_param + requestParam)
    REXML::Document.new(response.body)
  end
end
