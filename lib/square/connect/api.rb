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

      def items
        get(path: '/items', resource: Square::Connect::Resource::Item)
      end

      private

      def get(path:, resource:)
        Square::Connect::Request.new(api: self).get(path: path, resource: resource).resources
      end
    end
  end
end
