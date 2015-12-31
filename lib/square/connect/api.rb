module Square
  module Connect
    class Api
      def initialize(access_token:, location:)
        @access_token = access_token
        @location = location
      end

      def items
        get('/items')
      end

      private

      def get(path)
        Square::Connect::Request.get(
          access_token: access_token,
          location: location,
          path: path
        )
      end

      attr_reader :access_token, :location
    end
  end
end
