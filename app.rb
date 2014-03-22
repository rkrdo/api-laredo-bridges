$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'sinatra'
require 'lib/bwt/general'
require 'lib/bwt/laredo'
require 'json'

get "/" do
  send_file "public/index.html"
end

get "/bwt/:bridge_num.json" do
  content_type :json
  BWT::Laredo.send("bridge_#{params[:bridge_num]}").to_json
end
