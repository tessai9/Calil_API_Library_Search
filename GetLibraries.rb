# coding: utf-8
require 'rexml/document'
require './ApiRequest.rb'

# Get linraries
apiRequest = ApiRequest.new
responseXml = apiRequest.request('GET', '/library', 'pref=兵庫県&city=神戸市')

# Library Structure
Library = Struct.new( :systemid, :libid, :formal , :geocode)

# Parse and extract XML Dara
libraries = REXML::XPath.match(responseXml, "/Libraries/Library").map do |library|
  librarySystemId = library.elements['systemid'].text
  libraryLibId = library.elements['libid'].text
  libraryFormal = library.elements['formal'].text
  libraryGeoCode = library.elements['geocode'].text
  Library.new(librarySystemId, libraryLibId, libraryFormal, libraryGeoCode)
end

pp libraries
