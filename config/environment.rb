# Load the rails application
require File.expand_path('../application', __FILE__)

# Load app vars from local file
ozer_env = File.join(Rails.root, 'config', 'ozer.rb')
load(ozer_env) if File.exists?(ozer_env)

# Initialize the rails application
Ozer::Application.initialize!