module Square
  module Connect
    module Resource
      class Item
        # https://docs.connect.squareup.com/api/connect/v1/#datatype-item

        attr_reader \
          :id,
          :name,
          :description,
          :type,
          :abbreviation,
          :color,
          :visibility,
          :available_online,
          :available_for_pickup,
          :master_image,
          :category_id,
          :category,
          :variations,
          :modifier_lists,
          :fees

        def initialize(item)
          raise ArgumentError, 'Error parsing Item from nil' unless item

          @id = item['id']
          @name = item['name']
          @description = item['description']
          @type = item['type']
          @abbreviation = item['abbreviation']
          @color = item['color']
          @visibility = item['visibility']
          @available_online = item['available_online']
          @available_for_pickup = item['available_for_pickup']
          @master_image = item['master_image']
          @category_id = item['category_id']
          @category = parse_category(item['category'])
          @variations = parse_variations(item['variations'])
          @modifier_lists = parse_modifier_lists(item['modifier_lists'])
          @fees = parse_fees(item['fees'])
        end

        private

        def parse_category(category)
          category ? Square::Connect::Resource::Category.new(category) : nil
        end

        def parse_variations(variations)
          variations.map(&method(:parse_variation)).compact
        end

        def parse_variation(variation)
          variation ? Square::Connect::Resource::ItemVariation.new(variation) : nil
        end

        def parse_modifier_lists(modifier_lists)
          nil
        end

        def parse_fees(fees)
          nil
        end
      end
    end
  end
end
