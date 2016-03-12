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
          :images, # the docs don't show this, but it comes back from the API
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
          @master_image = parse_item_image(item['master_image'])
          @images = parse_item_images(item['images'])
          @category_id = item['category_id']
          @category = parse_category(item['category'])
          @variations = parse_variations(item['variations'])
          @modifier_lists = parse_modifier_lists(item['modifier_lists'])
          @fees = parse_fees(item['fees'])
        end

        private

        def parse_item_images(item_images)
          item_images ? item_images.map(&method(:parse_item_image)).compact : []
        end

        def parse_item_image(item_image)
          item_image ? Square::Connect::Resource::ItemImage.new(item_image) : nil
        end

        def parse_category(category)
          category ? Square::Connect::Resource::Category.new(category) : nil
        end

        def parse_variations(variations)
          variations ? variations.map(&method(:parse_variation)).compact : []
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
