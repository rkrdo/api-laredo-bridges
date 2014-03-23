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
        super.select do |p|
          p[:port_name] == "Laredo"
        end.each_with_index.each_with_object([]) do |(bridge, index), obj|
          obj << bridge.merge({cam_id: (index+1).to_s})
        end
      end

      def method_missing(name, *args)
        super unless name =~ /^bridge_(.*)$/ && BRIDGES.keys.include?($1.to_sym)
        all_ports.select { |p| p[:port_number] == BRIDGES[$1.to_sym] }.first
      end

    end
  end
end
