require 'spec_helper'

module BWT
  describe General do
    let(:border) { BWT::General }
    let(:xml_response) { File.new("#{Dir.pwd}/spec/utils/bwt.xml") }

    before(:each) do
      stub_request(:get, 'http://apps.cbp.gov/bwt/bwt.xml').to_return(body: xml_response)
    end

    describe "building the hash" do
      it "returns all the xml" do
        border.send(:build_hash).must_equal BWT_HASH
      end
    end

    describe "#all_ports" do
      it "returns all of the ports" do
        border.all_ports.must_equal BWT_HASH["border_wait_time"]["port"]
      end
    end

    describe "#find_by_port_name" do
      it "returns ports that match the port name" do
        border.find_by_port_name("Laredo").length.must_equal 4
        border.find_by_port_name("san ysidro").length.must_equal 1
        border.find_by_port_name("Laredo").first[:port_number].must_equal "230401"
        border.find_by_port_name("pharr").first[:port_number].must_equal "230503"
      end
    end
  end

end
