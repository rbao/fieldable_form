module FieldableForm
  class DropDown < Field
    
    # Overrides
    def render_method
      :select
    end

    # Overrides
    def render_options
      items_array = items.split(',').map(&:strip)
      if include_blank == '1'
        items_array.map! { |i| [i, i] }
        items_array.first[1] = nil
      end
      [name, items_array]
    end

    # Overrides
    def view_partial_name
      'drop_down'
    end

    # Overrides
    def validators
      validators = []
      validators << ActiveModel::Validations::PresenceValidator.new(:attributes => name) if required == '1'
      validators
    end

    def required
      options['required']
    end

    def required=(value)
      options_will_change! if options['required'] != value
      options['required'] = value
    end

    def include_blank
      options['include_blank']
    end

    def include_blank=(value)
      options_will_change! if options['include_blank'] != value
      options['include_blank'] = value
    end

    def items
      options['items']
    end

    def items=(value)
      options_will_change! if options['items'] != value
      options['items'] = value
    end

  end
end