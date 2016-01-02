require 'sinatra/base'
require 'sinatra/namespace'

class FakeSquareConnectApi < Sinatra::Base
  register Sinatra::Namespace

  namespace '/v1' do
    namespace '/:location' do
      get '/DUMMY' do
        json_response 200, 'dummy.json'
      end

      get '/items' do
        json_response 200, 'items.json'
      end
    end
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
