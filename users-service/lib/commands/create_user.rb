module Commands
  class CreateUser < Dry::Struct
    attribute :full_name, Types::String.optional

    def self.command_name
      'create_user'
    end
  end
end