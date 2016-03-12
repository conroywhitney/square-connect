module Square
  module Connect
    module Resource
      class Item < BaseResource
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
          @master_image = Square::Connect::Resource::ItemImage.parse(item['master_image'])
          @images = Square::Connect::Resource::ItemImage.parse(item['images'])
          @category_id = item['category_id']
          @category = Square::Connect::Resource::Category.parse(item['category'])
          @variations = Square::Connect::Resource::ItemVariation.parse(item['variations'])
          @modifier_lists = nil
          @fees = nil
        end
      end
    end
  end
end
