class FieldableForm::BootstrapGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :form_name, :type => :string

  def generate_models
    template 'form.rb', "app/models/#{uname}.rb"
  end

  def generate_assets
    template 'fieldable_form.js.coffee', "app/assets/javascripts/#{uname}.js.coffee"
  end

  def generate_helpers
    template 'fieldable_form_helper.rb', "app/helpers/#{uname}_helper.rb"
  end

  def generate_views
    template 'views/builder/_text_field.html.erb', "app/views/#{pname}/builder/_text_field.html.erb"
    template 'views/builder/_drop_down.html.erb', "app/views/#{pname}/builder/_drop_down.html.erb"
    template 'views/builder/_check_box.html.erb', "app/views/#{pname}/builder/_check_box.html.erb"
    template 'views/entry/_field.html.erb', "app/views/#{pname}/entry/_field.html.erb"
    template 'views/builder/_fields.html.erb', "app/views/#{pname}/builder/_fields.html.erb"
  end

  private
    def pname
      uname.pluralize
    end

    def uname
      form_name.underscore
    end

    def dname
      uname.dasherize
    end

    def cname
      form_name.camelize
    end
end
