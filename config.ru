$stdout.sync = $stderr.sync = true

require 'rubygems'
require 'sinatra/base'
require 'rack/timeout'
require 'rack/cache'
require 'rack/csrf'

use Rack::Timeout
Rack::Timeout.timeout = 28 # Default is 15s, let's go to 28. Heroku Stack times out at 30s.

use Rack::Deflater
use Rack::ETag
use Rack::CommonLogger

require './app'
run Sinatra::Application
