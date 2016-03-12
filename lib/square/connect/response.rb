module Square
  module Connect
    class Response
      def initialize(http_response:, resource:)
        fail 'Missing response' unless http_response

        @http_response = http_response
        @resource = resource
      end

      def ok?
        status == 200
      end

      def status
        http_response.code.to_i
      end

      def message
        http_response.message
      end

      def data
        JSON.parse(http_response.body) if ok?
      end

      def resources
        data.map { |d| resource.new(d) } if data
      end

      private

      attr_reader :http_response, :resource
    end
  end
end
