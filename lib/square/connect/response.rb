module Square
  module Connect
    class Response
      def initialize(http_response:, resource_class:)
        fail 'Missing response' unless http_response

        @http_response = http_response
        @resource_class = resource_class
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

      def resource_list
        data.map { |d| resource_class.new(d) } if data
      end

      def resource
        resource_class.new(data) if data
      end

      private

      attr_reader :http_response, :resource_class
    end
  end
end
