$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'sinatra'
require 'sinatra/respond_with'
require 'lib/bwt/general'
require 'lib/bwt/laredo'
require 'json'

BRIDGES =  {
  "1" => "one",
  "2" => "two",
  "3" => "three",
  "4" => "four"
}

respond_to :json

get "/laredo/:bridge_num" do
  respond_with BWT::Laredo.send("bridge_#{BRIDGES[params[:bridge_num].to_s]}")
end

get "/laredo" do
  respond_with BWT::Laredo.all_ports
end
