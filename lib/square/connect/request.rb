module Square
  module Connect
    class Request
      BASE_URL = 'https://connect.squareup.com/v1/'

      def self.get(access_token:, location:, path:)
        result = nil
        uri = Square::Connect::Request.uri(location: location, path: path)

        Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
          request = Net::HTTP::Get.new uri
          request['Authorization'] = "Bearer #{access_token}"

          response = http.request request # Net::HTTPResponse object

          result = JSON.parse(response.body)
        end

        result
      end

      def self.uri(location:, path:)
        fail 'Missing location' if location.nil?
        fail 'Missing path' if path.nil?
        fail 'Path must be relative and begin with a /' unless path.start_with? '/'

        URI.parse(BASE_URL + location + path)
      end
    end
  end
end
