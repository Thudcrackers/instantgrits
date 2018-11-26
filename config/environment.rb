# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Paperclip.options[:command_path] = "C:\\Program Files\\ImageMagick-7.0.8-Q16"
