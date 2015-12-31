module Square
  module Connect
    class Request
      def get(path)
        result = nil
        uri = URI('https://connect.squareup.com' + path)
        access_token = "1234"

        Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
          request = Net::HTTP::Get.new uri
          request['Authorization'] = "Bearer #{access_token}"

          response = http.request request # Net::HTTPResponse object

          result = JSON.parse(response.body)
        end

        result
      end
    end
  end
end
