# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  # [...]
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  # [...]
end
