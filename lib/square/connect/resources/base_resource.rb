module Square
  module Connect
    module Resource
      class BaseResource
        def initialize
          raise 'Square::Connect::Resource::BaseResource is an abstract class'
        end

        class << self
          def parse(data)
            data.is_a?(Array) ? parse_array(data) : parse_object(data)
          end

          private

          def parse_array(arr)
            arr ? arr.map(&method(:parse_object)).compact : []
          end

          def parse_object(obj)
            obj ? new(obj) : nil
          end
        end
      end
    end
  end
end
