ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
RSpec.configure do |config|
  config.after(:each) do
    Brand.all().each() do |answer|
      answer.destroy()
    end
  end

  config.after(:each) do
    Store.all().each() do |survey|
      survey.destroy()
    end
  end
end
