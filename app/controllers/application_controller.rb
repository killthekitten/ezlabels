class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV['BASIC_AUTH_NAME'].presence ||
                                     fail('BASIC_AUTH_NAME not provided, check .env'),
                               password: ENV['BASIC_AUTH_NAME'].presence ||
                                         fail('BASIC_AUTH_PASSWORD not provided, check .env'),
                               except: :index
end
