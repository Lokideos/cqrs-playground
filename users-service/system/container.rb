# frozen_string_literal: true

require 'dry/system/container'

class App < Dry::System::Container
  configure do |config|
    config.component_dirs.add 'lib'
  end
end
