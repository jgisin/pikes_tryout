require 'square_connect'

access_token = 'sq0atb-UzxBwXICPZ4d4axNZoCJSw'

locationApi = SquareConnect::LocationApi.new()
locations = locationApi.list_locations(access_token)
puts locations

