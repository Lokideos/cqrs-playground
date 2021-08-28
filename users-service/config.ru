# frozen_string_literal: true

require_relative './web_app'
require_relative './config/boot'
require "hanami/middleware/body_parser"

use Hanami::Middleware::BodyParser, :json

run WebApp.new
