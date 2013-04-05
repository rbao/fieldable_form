require 'rails'
require 'active_support'
require 'active_record'
require 'fieldable_form/engine'

require 'fieldable_form/exceptions'
require 'fieldable_form/validatable'
require 'fieldable_form/entry_validations'

require 'fieldable_form/field'
require 'fieldable_form/text_field'
require 'fieldable_form/check_box'
require 'fieldable_form/drop_down'

module FieldableForm

  def self.table_name_prefix
    'fieldable_form_'
  end

end
