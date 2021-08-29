task :settings do
  ENV['RACK_ENV'] ||= 'development'
  require "dotenv"
  Dotenv.load(".env", ".env.#{ENV["APP_ENV"]}")
end