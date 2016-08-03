require 'square_connect'

access_token = 'sq0atp-2UvaCyAUpLEyNAyanrFbWg'

locationApi = SquareConnect::LocationApi.new()
locations = locationApi.list_locations(access_token)
puts locations
