require 'ostruct'

module FieldableForm
  class Validatable < OpenStruct
    include ActiveModel::Validations

    attr_accessor :errors
    def initialize(*args)
      @errors = ActiveModel::Errors.new(self)
      super(*args)
    end

    def self.i18n_scope
      :activerecord
    end
  
  end 
end
