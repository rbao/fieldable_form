module FieldableForm
  class TextField < AbstractField

    attr_accessible :required, :number_only, :min_length, :max_length

    validates :min_length, :allow_blank => true, :numericality => { :only_integer => true }, :length => { :maximum => 255 }
    validates :max_length, :allow_blank => true, :numericality => { :only_integer => true }, :length => { :maximum => 255 }

    # Overrides
    def render_method
      :text_field
    end

    # Overrides
    def render_options
      [name]      
    end

    # Overrides
    def view_partial_name
      'text_field'
    end

    # Overrides
    def validators
      min = integerize_or_nil(min_length)
      max = integerize_or_nil(max_length)

      validators = []
      validators << ActiveModel::Validations::PresenceValidator.new(:attributes => name) if required == '1'
      validators << ActiveModel::Validations::NumericalityValidator.new(:attributes => name, :only_integer => true) if number_only == '1'
      validators << ActiveModel::Validations::LengthValidator.new(:attributes => name, :minimum => min ) if min
      validators << ActiveModel::Validations::LengthValidator.new(:attributes => name, :maximum => max ) if max
      validators
    end

    def required
      options['required']
    end

    def required=(value)
      options_will_change! if options['required'] != value
      options['required'] = value
    end

    def number_only
      options['number_only']
    end

    def number_only=(value)
      options_will_change! if options['number_only'] != value
      options['number_only'] = value
    end

    def min_length
      options['min_length']
    end

    def min_length=(value)
      options_will_change! if options['min_length'] != value
      options['min_length'] = value
    end

    def max_length
      options['max_length']
    end

    def max_length=(value)
      options_will_change! if options['max_length'] != value
      options['max_length'] = value
    end

    private

      def integerize_or_nil(str)
        begin
          result = Integer(str)
        rescue ArgumentError, TypeError
          result = nil
        end
        result
      end

  end
end