require './api/laredo_bridges'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', methods: :get, headers: :any, max_age: 0
  end
end

run API::LaredoBridges
