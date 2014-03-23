$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'sinatra'
require 'lib/bwt/general'
require 'lib/bwt/laredo'
require 'json'

BRIDGES =  {
  "1" => "one",
  "2" => "two",
  "3" => "three",
  "4" => "four"
}

get "/" do
  send_file "public/index.html"
end

get "/laredo/:bridge_num.json" do
  content_type :json
  BWT::Laredo.send("bridge_#{BRIDGES[params[:bridge_num].to_s]}").to_json
end

get "/laredo.json" do
  content_type :json
  BWT::Laredo.all_ports.to_json
end
