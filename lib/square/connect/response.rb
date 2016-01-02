module Square
  module Connect
    class Response
      def initialize(http_response:)
        fail 'Missing response' unless http_response

        @http_response = http_response
      end

      def ok?
        status == 200
      end

      def status
        http_response.code.to_i
      end

      def data
        JSON.parse(http_response.body)
      end

      private

      attr_reader :http_response
    end
  end
end
