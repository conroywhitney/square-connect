module Square
  module Connect
    class Api
      def initialize(access_token:)
        @access_token = access_token
      end

      def items
        authorize(Square::Connect::Request.new)
        request.get("/v1/#{location}/items")
      end

      private

      attr_reader :access_token
    end
  end
end
