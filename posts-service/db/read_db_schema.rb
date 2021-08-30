Sequel.migration do
  change do
    create_table(:comments) do
      primary_key :id, :type=>:Bignum
      column :post_id, "bigint", :null=>false
      column :body, "character varying", :null=>false
      column :author_name, "character varying", :null=>false
      column :created_at, "timestamp(6) without time zone", :null=>false
      column :updated_at, "timestamp(6) without time zone", :null=>false
    end
    
    create_table(:posts) do
      primary_key :id, :type=>:Bignum
      column :title, "character varying", :null=>false
      column :body, "character varying", :null=>false
      column :author_name, "character varying", :null=>false
      column :comments_count, "bigint", :default=>0
      column :created_at, "timestamp(6) without time zone", :null=>false
      column :updated_at, "timestamp(6) without time zone", :null=>false
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:users) do
      primary_key :id, :type=>:Bignum
      column :full_name, "character varying", :null=>false
      column :created_at, "timestamp(6) without time zone", :null=>false
      column :updated_at, "timestamp(6) without time zone", :null=>false
      
      index [:full_name], :name=>:index_users_on_full_name, :unique=>true
    end
  end
end
