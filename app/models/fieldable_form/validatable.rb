module FieldableForm
  class Validatable < OpenStruct
    include ActiveModel::Validations

    attr_accessor :errors
    def initialize(*args)
      @errors = ActiveModel::Errors.new(self)
      super(*args)
    end
  
  end 
end
