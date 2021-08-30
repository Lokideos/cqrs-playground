# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:comments) do
      primary_key :id, type: :Bignum
      column :post_id, 'bigint', null: false
      column :body, 'character varying', null: false
      column :author_name, 'character varying', null: false
      column :created_at, 'timestamp(6) without time zone', null: false
      column :updated_at, 'timestamp(6) without time zone', null: false
    end
  end

  down do
    drop_table(:comments)
  end
end
