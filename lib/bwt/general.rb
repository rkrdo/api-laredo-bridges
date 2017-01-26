require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/hash/conversions'
require 'net/http'

module BWT
  class General < BasicObject
    class << self
      def uri
        URI 'https://apps.cbp.gov/bwt/bwt.xml'
      end

      def all_ports
        build_hash[:border_wait_time][:port]
      end

      def find_by_port_name(name)
        all_ports.select { |port| port[:port_name].match Regexp.new(name, true) }
      end

      private

        def build_hash
          Hash.from_xml(make_request).with_indifferent_access
        end

        def make_request
          Net::HTTP.get uri
        end

    end
  end
end
