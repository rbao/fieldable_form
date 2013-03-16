def setup_nulldb
  schema_path = File.expand_path("../../dummy/db/schema.rb", __FILE__)
  NullDB.nullify(schema: schema_path)
end

def teardown_nulldb
  NullDB.restore
end