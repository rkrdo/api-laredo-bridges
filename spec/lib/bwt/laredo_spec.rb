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

    describe "#bridge" do

      describe "one" do
        it "returns info in bridge one" do
          laredo.bridge(:one).must_equal LAREDO_HASH[0]
        end
      end

      describe "two" do
        it "returns info in bridge two" do
          laredo.bridge(:two).must_equal LAREDO_HASH[1]
        end
      end

      describe "three" do
        it "returns info in bridge three" do
          laredo.bridge(:three).must_equal LAREDO_HASH[2]
        end
      end

      describe "four" do
        it "returns info in bridge four" do
          laredo.bridge(:four).must_equal LAREDO_HASH[3]
        end
      end

      describe "invalid" do
        it "returns nil" do
          laredo.bridge(:five).must_equal nil
        end
      end
    end

  end
end
