# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id, type: :Bignum
      column :full_name, 'character varying', null: false
      column :created_at, 'timestamp(6) without time zone', null: false
      column :updated_at, 'timestamp(6) without time zone', null: false

      index [:full_name], name: :index_users_on_full_name, unique: true
    end
  end

  down do
    drop_table :users
  end
end
