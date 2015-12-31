module Square
  module Connect
    class Api
      def initialize(access_token:)
        @access_token = access_token
      end

      private

      attr_reader :access_token
    end
  end
end
