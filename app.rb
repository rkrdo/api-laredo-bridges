$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'sinatra'
require 'sinatra/respond_with'
require 'rack/cors'
require 'lib/bwt/general'
require 'lib/bwt/laredo'
require 'json'

BRIDGES =  {
  "1" => "one",
  "2" => "two",
  "3" => "three",
  "4" => "four"
}

use Rack::Cors do
  allow do
      origins '*'
      resource '*', methods: :get, headers: :any, max_age: 0
  end
end

respond_to :json

get "/laredo/:bridge_num" do
  respond_with BWT::Laredo.send("bridge_#{BRIDGES[params[:bridge_num].to_s]}")
end

get "/laredo" do
  respond_with BWT::Laredo.all_ports
end
