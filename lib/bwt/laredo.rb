module BWT
  class Laredo < BWT::General
    class << self

      BRIDGES = {
        one: "230401",
        two: "230402",
        three: "230403",
        four: "230404"
      }

      CAMS = {
        "1" => {
          title: 'Puente de las Americas (Bridge I)',
          images: {
            us: 'http://www.cityoflaredo.com/bridgesys/EntryLanees/172.21.51.112/hugeb1cam1.jpg',
            mx: 'http://www.ci.laredo.tx.us/bridgesys/TowerBridge/172.21.51.88/b1mex.jpg'
          }
        },
        "2" => {
          title: 'Juarez-Lincoln (Bridge II)',
          images: {
            us: 'http://www.cityoflaredo.com/bridgesys/B2USA.jpg',
            mx: 'http://www.cityoflaredo.com/bridgesys/b2mex.jpg'
          }
        },
        "3" => {
          title: 'Colombia (Bridge III)',
          images: {
            us: 'http://www.cityoflaredo.com/bridgesys/Check_Point/172.21.53.45/hugeb3cam2.jpg',
            mx: 'http://www.cityoflaredo.com/bridgesys/Bridge3_Span/172.21.53.58/b3mex.jpg'
          }
        },
        "4" => {
          title: 'World Trade (Bridge IV)',
          images: {
            us: 'http://www.cityoflaredo.com/bridgesys/B4-US-side/172.21.54.24/hugeb4cam2.jpg',
            mx: 'http://www.cityoflaredo.com/bridgesys/Bridge_Span/172.21.54.29/b4mex.jpg'
          }
        }
      }

      def all_ports
        super.select(&laredo).each_with_index.each_with_object([]) do |(bridge, index), obj|
          obj << bridge.merge({id: (index+1).to_s}).merge(CAMS["#{(index+1).to_s}"])
        end
      end

      def bridge(bridge_num)
        all_ports.detect { |p| p[:port_number] == BRIDGES[bridge_num] }
      end

      private

      def laredo
        ->(p) { p[:port_name] == 'Laredo' }
      end

    end
  end
end
