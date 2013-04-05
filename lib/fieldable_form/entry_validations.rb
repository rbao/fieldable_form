module FieldableForm
  module EntryValidations
    extend ActiveSupport::Concern

    module ClassMethods
      def validate_fieldable_form_entry(form, values)
        cattr_accessor :fieldable_form_getter_method, :fieldable_form_values_getter_method
        self.fieldable_form_getter_method = form.to_sym
        self.fieldable_form_values_getter_method = values.to_sym
        
        validate :ensure_fieldable_form_valid
      end
    end

    private

      def ensure_fieldable_form_valid
        values = self.send(fieldable_form_values_getter_method)
        validatable = Validatable.new(values)

        self.send(fieldable_form_getter_method).fields.each do |field|
          field.validators.each { |v| v.validate(validatable) }
        end

        validatable.errors.each do |k, msg|
          errors.add(k, msg)
        end
      end

  end
end

