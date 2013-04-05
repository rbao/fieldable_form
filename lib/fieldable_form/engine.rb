module FieldableForm
  class Engine < ::Rails::Engine
    initializer 'fieldable_form.add_migration_paths' do |app|
      app.config.paths['db/migrate'] += FieldableForm::Engine.paths['db/migrate'].existent
    end
  end
end