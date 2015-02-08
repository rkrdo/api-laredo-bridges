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
            us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb1cam1.jpg',
            mx: 'http://www.ci.laredo.tx.us/bridgesys/TowerBridge/172.21.51.88/b1mex.jpg'
          }
        },
        "2" => {
          title: 'Juarez-Lincoln (Bridge II)',
          images: {
            us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb2cam1.jpg',
            mx: 'http://www.ci.laredo.tx.us/bridgesys/hugeb2cam2.jpg'
          }
        },
        "3" => {
          title: 'Colombia (Bridge III)',
          images: {
            us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb3cam2.jpg',
            mx: 'http://www.ci.laredo.tx.us/bridgesys/Bridge3_Span/172.21.53.58/b3mex.jpg'
          }
        },
        "4" => {
          title: 'World Trade (Bridge IV)',
          images: {
            us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb4cam2.jpg',
            mx: 'http://www.ci.laredo.tx.us/bridgesys/Bridge_Span/172.21.54.29/b4mex.jpg'
          }
        }
      }

      def all_ports
        super.select do |p|
          p[:port_name] == "Laredo"
        end.each_with_index.each_with_object([]) do |(bridge, index), obj|
          obj << bridge.merge({id: (index+1).to_s}).merge(CAMS["#{(index+1).to_s}"])
        end
      end

      def method_missing(name, *args)
        super unless name =~ /^bridge_(.*)$/ && BRIDGES.keys.include?($1.to_sym)
        all_ports.select { |p| p[:port_number] == BRIDGES[$1.to_sym] }.first
      end

    end
  end
end
