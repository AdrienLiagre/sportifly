# This file is used by Rack-based servers to start the application.
# sudo service elasticsearch start
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application