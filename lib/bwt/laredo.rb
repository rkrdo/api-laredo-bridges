module BWT
  class Laredo < BWT::General
    class << self

      def all_ports
        super.select { |p| p[:port_name] == "Laredo" }
      end

      def bridge_one
        find_bridge 230401
      end

      def bridge_two
        find_bridge 230402
      end

      def bridge_three
        find_bridge 230403
      end

      def bridge_four
        find_bridge 230404
      end

      private

        def find_bridge(port_number)
          all_ports.select{ |p| p[:port_number] == port_number.to_s }.first
        end

    end
  end
end
