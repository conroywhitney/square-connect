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
        get('/items')
      end

      private

      def get(path)
        Square::Connect::Request.new(api: self).get(path: path)
      end
    end
  end
end
