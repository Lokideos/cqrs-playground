Sequel.migration do
  change do
    create_table(:comments) do
      primary_key :id, :type=>:Bignum
      column :post_id, "bigint", :null=>false
      column :body, "character varying", :null=>false
      column :author_id, "bigint", :null=>false
      column :created_at, "timestamp(6) without time zone", :null=>false
      column :updated_at, "timestamp(6) without time zone", :null=>false
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
  end
end
