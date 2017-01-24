Hanami::Model.migration do
  up do
    execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'
    create_table :users do
      primary_key :id, 'uuid', null: false, default: Hanami::Model::Sql.function(:uuid_generate_v4)
      column :email, String
      column :password, String
    end
  end
end
