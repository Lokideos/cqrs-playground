module Commands
  class CreateComment < Dry::Struct
    attribute :text, Types::String
  end
end
