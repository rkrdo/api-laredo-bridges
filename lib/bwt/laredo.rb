module BWT
  class Laredo < BWT::General
    class << self

      BRIDGES = {
        one: "230401",
        two: "230402",
        three: "230403",
        four: "230404"
      }

      def all_ports
        super.select { |p| p[:port_name] == "Laredo" }
      end

      def method_missing(name, *args)
        super unless name =~ /^bridge_(.*)$/ && BRIDGES.keys.include?($1.to_sym)
        all_ports.select { |p| p[:port_number] == BRIDGES[$1.to_sym] }.first
      end

    end
  end
end
