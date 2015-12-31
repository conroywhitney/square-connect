module Square
  module Connect
    class Api
      def initialize(access_token:, location:)
        @access_token = access_token
        @location = location
      end

      def items
        authorize(Square::Connect::Request.new)
        request.get("/v1/#{location}/items")
      end

      private

      attr_reader :access_token, :location
    end
  end
end
