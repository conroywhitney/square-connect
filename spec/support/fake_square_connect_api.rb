require 'sinatra/base'

class FakeSquareConnectApi < Sinatra::Base
  get '*' do
    json_response 200, 'ok.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
