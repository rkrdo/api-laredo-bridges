require 'rack/test'
require_relative '../spec_helper'
require_relative '../../api/laredo_bridges'


describe API::LaredoBridges do
  include Rack::Test::Methods

  def app
    API::LaredoBridges
  end

  describe 'get /laredo' do
    let(:xml_response) { File.new("#{Dir.pwd}/spec/utils/bwt.xml") }

    before(:each) do
      stub_request(:get, 'http://apps.cbp.gov/bwt/bwt.xml').to_return(body: xml_response)
      get '/laredo'
    end

    it 'returns 200' do
      last_response.status.must_equal 200
    end

    it 'returns the correct json' do
      last_response.body.must_equal LAREDO_HASH.to_json
    end
  end

end
