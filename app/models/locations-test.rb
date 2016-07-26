require 'square_connect'

access_token = 'sq0atb-_od_nGk4vY-5SLK_i75ZRg'

locationApi = SquareConnect::LocationApi.new()
locations = locationApi.list_locations(access_token)
puts locations

