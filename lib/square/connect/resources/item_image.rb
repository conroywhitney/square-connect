module Square
  module Connect
    module Resource
      class ItemImage
        # https://docs.connect.squareup.com/api/connect/v1/#datatype-itemimage

        attr_reader \
          :id,
          :url

        def initialize(item_image)
          raise ArgumentError, 'Error parsing ItemImage from nil' unless item_image

          @id = item_image['id']
          @url = item_image['url']
        end
      end
    end
  end
end
