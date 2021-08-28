# frozen_string_literal: true

require 'dry/system/container'

class App < Dry::System::Container
  configure do |config|
    config.name = :main
    config.auto_register = %w[lib]
  end

  load_paths!('lib')
end
