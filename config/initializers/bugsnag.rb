Bugsnag.configure do |config|
  config.notify_release_stages = ['production']
  config.api_key = ENV['BUGSNAG_API_KEY']
end
