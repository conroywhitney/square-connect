module Square
  module Connect
    class Api
      attr_reader :access_token, :location

      def initialize(access_token:, location:)
        fail 'Missing access token' if access_token.nil?
        fail 'Missing location' if location.nil?

        @access_token = access_token
        @location = location
      end

      def items(include_image: false)
        include_image ? items_with_images : items_without_images
      end

      def item(item_id)
        response = get(path: "/items/#{item_id}", resource_class: Square::Connect::Resource::Item)
        item = response.resource
      end

      private

      def items_without_images
        get(path: '/items', resource_class: Square::Connect::Resource::Item).resource_list
      end

      def items_with_images
        items_without_images.map { |item_without_image| item(item_without_image.id) }
      end

      def get(path:, resource_class:)
        Square::Connect::Request.new(api: self).get(path: path, resource_class: resource_class)
      end
    end
  end
end
