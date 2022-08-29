class ApplicationController < ActionController::Base
  include Authentication
  
  def self.view_accessor(*names)
    attr_accessor *names
    helper_method *names
  end
end
