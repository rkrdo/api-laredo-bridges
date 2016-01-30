$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'grape'
require 'bwt/general'
require 'bwt/laredo'

module API
  class LaredoBridges < Grape::API
    format :json

    BRIDGES =  {
      "1" => "one",
      "2" => "two",
      "3" => "three",
      "4" => "four"
    }

    resource :laredo do

      desc 'Get status for all Laredo ports'
      get '/' do
        BWT::Laredo.all_ports
      end

      desc 'Return a specific bridge by number'
      params do
        requires :bridge_num, type: Integer, desc: 'Bridge Number'
      end
      route_param :bridge_num do
        get do
          BWT::Laredo.bridge(BRIDGES[params[:bridge_num].to_s].to_sym)
        end
      end

    end

  end

end
