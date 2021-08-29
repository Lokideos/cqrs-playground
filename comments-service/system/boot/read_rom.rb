# frozen_string_literal: true

App.boot(:read_rom) do |app|
  init do
    require "rom"
    require "rom-sql"
    require "rom-repository"

    container = ROM.container(:sql, ENV['READ_DB_URL']) do |configuration|
      configuration.relation(:comments) do
        schema(infer: true)
        auto_struct true
      end
    end

    register(:read_rom, container)
  end
end
