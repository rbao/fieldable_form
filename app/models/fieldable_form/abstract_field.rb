module FieldableForm
  class AbstractField < ActiveRecord::Base

    DESCENDANTS = %w(FieldableForm::TextField FieldableForm::DropDown FieldableForm::CheckBox)

    self.table_name = :fieldable_form_fields

    attr_accessible :name, :options, :type

    belongs_to :fieldable, :polymorphic => true, :touch => true

    validates :name, :presence => true, :length => { :maximum => 255 }
    validates :type, :presence => true, :inclusion => { :in => DESCENDANTS }

    serialize :options, Hash

    # Create the appropriate children instance according to the type.
    def self.new(*args, &block)
      # Children should use the original method
      return super(*args, &block) if self != ::FieldableForm::AbstractField
      
      attributes = args.first
      raise CannotInitializeAbstractClass.new('FieldableForm::AbstractField is an abstract class') unless attributes.is_a?(Hash)

      type = attributes[:type] || attributes['type']
      return type.constantize.new(*args, &block) if DESCENDANTS.include?(type)
      
      raise CannotInitializeAbstractClass.new('FieldableForm::AbstractField is an abstract class')
    end

    def render_method
      raise NotImplementedError('Subclass must implement this')
    end

    def render_options
      raise NotImplementedError('Subclass must implement this')
    end

    def view_partial_name
      raise NotImplementedError('Subclass must implement this')
    end

    def validators
      raise NotImplementedError('Subclass must implement this')
    end

  end
end