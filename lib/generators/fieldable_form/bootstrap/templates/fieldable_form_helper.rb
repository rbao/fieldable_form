module <%= cname %>Helper

  # @param [ActionView::Helpers::FormBuilder] f The rails form builder object.
  # @param [String, Symbol] field_type The field type, currently can only be :text_field, :drop_down or :check_box.
  # @param [String] partial The partial to render when a field is added.
  # @param [Hash] html_options The html options for the <a> tag. This options will be passed to the rails
  #   default link_to helper.
  # @return a link with approriate data atrribute so that the right js will be hooked
  #   and when clicked will add a new field.
  def <%= uname %>_add_field(f, name, field_type, target, partial, html_options = {})
    partial ||= association.to_s.singularize + "_fields"
    klass = "FieldableForm::#{field_type.to_s.camelize}".constantize
    new_object = klass.new
    
    id = new_object.object_id
    fields = f.fields_for(:fields, new_object, child_index: id) do |builder|
      render(partial, f: builder)
    end

    default = { data: { <%= uname %>: 'add_field', target: target, id: id, fields: fields.gsub("\n", "") } }
    html_options = default.deep_merge(html_options)
    link_to(name, '#', html_options)
  end
end