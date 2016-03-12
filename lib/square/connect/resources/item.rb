module Square
  module Connect
    module Resource
      class Item
        attr_reader :id, :fees, :variations, :available_for_pickup, :available_online, :visibility,
                     :description, :name, :category_id, :category, :type

        def initialize(item)
          puts item
          raise ArgumentError, 'Error parsing Item from nil' unless item

          @id = item['id']
          @fees = item['fees']
          @variations = item['variations'].map(&method(:parse_variation)).compact
          @available_for_pickup = item['available_for_pickup']
          @available_online = item['available_online']
          @visibility = item['visibility']
          @description = item['description']
          @name = item['name']
          @category = parse_category(item['category'])
          @category_id = item['category_id']
          @type = item['type']
        end

        private

        def parse_variation(variation)
          variation ? Square::Connect::Resource::Variation.new(variation) : nil
        end

        def parse_category(category)
          category ? Square::Connect::Resource::Category.new(category) : nil
        end
      end
    end
  end
end
