require 'spec_helper'

module BWT
  describe Laredo do
    let(:laredo) { BWT::Laredo }
    let(:xml_response) { File.new("#{Dir.pwd}/spec/utils/bwt.xml") }

    before(:each) do
      stub_request(:get, 'http://apps.cbp.gov/bwt/bwt.xml').to_return(body: xml_response)
    end

    describe "#all_ports" do
      it "returns all ports from Laredo" do
        laredo.all_ports.must_equal LAREDO_HASH
      end
    end

    describe "#bridge_one" do
      it "returns info in bridge one" do
        laredo.bridge_one.must_equal LAREDO_HASH[0]
      end
    end

    describe "#bridge_two" do
      it "returns info in bridge two" do
        laredo.bridge_two.must_equal LAREDO_HASH[1]
      end
    end

    describe "#bridge_three" do
      it "returns info in bridge three" do
        laredo.bridge_three.must_equal LAREDO_HASH[2]
      end
    end

    describe "#bridge_four" do
      it "returns info in bridge four" do
        laredo.bridge_four.must_equal LAREDO_HASH[3]
      end
    end
  end
end
