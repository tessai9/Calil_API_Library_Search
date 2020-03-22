# coding: utf-8
require 'rexml/document'
require 'readline'
require './ApiRequest.rb'

# Get user input
puts 'Input ISBN No you want to read.'
inputIsbn = Readline.readline('> ')

# Start request
apiRequest = ApiRequest.new
responseXml = apiRequest.request(
  'GET',
  '/check',
  'systemid=Hyogo_Kobe&isbn=' + inputIsbn + '&format=xml'
)

pp responseXml
