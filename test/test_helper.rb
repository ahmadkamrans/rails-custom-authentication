ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def current_user
    if session[:current_user_id].present?
      User.find_by(id: session[:current_user_id])
    end
  end

  # Add more helper methods to be used by all tests here...
end
