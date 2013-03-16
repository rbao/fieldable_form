module FieldableForm
  class BaseForm < ActiveRecord::Base
    self.table_name = :fieldable_forms

    belongs_to :owner, :polymorphic => true

    attr_accessible :fields_attributes

    has_many :fields, :class_name => AbstractField, :as => :fieldable, :dependent => :destroy
    accepts_nested_attributes_for :fields, :allow_destroy => true
  end
end