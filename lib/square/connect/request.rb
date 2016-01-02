module Square
  module Connect
    class Request
      BASE_URL = 'https://connect.squareup.com/v1'

      def initialize(api:)
        fail 'Missing API' unless api

        @api = api
      end

      def get(path:)
        http_response = nil
        uri = uri(path: path)

        Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
          request = Net::HTTP::Get.new uri
          request['Authorization'] = "Bearer #{api.access_token}"

          http_response = http.request request # Net::HTTPResponse object
        end

        Square::Connect::Response.new(http_response: http_response)
      end

      def uri(path:)
        fail 'Missing path' if path.nil?
        fail 'Path must be relative and begin with a /' unless path.start_with? '/'

        URI.parse(BASE_URL + '/' + api.location + path)
      end

      private

      attr_reader :api
    end
  end
end
