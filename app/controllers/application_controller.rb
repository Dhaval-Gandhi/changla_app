class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => "changla", :password => "9993" 
end
