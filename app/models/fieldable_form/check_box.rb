module FieldableForm
  class CheckBox < Field
    
    # Overrides
    def render_method
      :check_box
    end

    # Overrides
    def render_options
      [name]
    end

    # Overrides
    def view_partial_name
      'check_box'
    end

    # Overrides
    def validators
      []
    end
    
  end
end