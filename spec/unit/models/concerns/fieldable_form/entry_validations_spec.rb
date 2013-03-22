require 'spec_helper'

module FieldableForm
  
  class MockModel
    include ActiveModel::Validations
    include FieldableForm::EntryValidations

    attr_accessor :form, :values

    def initialize(form, values)
      @form = form
      @values = values || {}
      @errors = ActiveModel::Errors.new(self)
    end

    validate_fieldable_form :form, :values
  end

  describe Validations do
    let(:model) { MockModel.new(form, values) }

    context 'when the form contains required field' do
      let(:field1) { build_stubbed(:text_field, :required) }
      let(:form) { stub(:fields => [field1]) }
      
      context 'and the model does not have that field filled' do
        let(:values) { { field1.name => '' } }
        specify { model.should_not be_valid }
      end

      context 'and the model have that field filled' do
        let(:values) { { field1.name => 'random text' } }
        specify { model.should be_valid }
      end
    end

    context 'when the form contains number only field' do
      let(:field1) { build_stubbed(:text_field, :number_only) }
      let(:form) { stub(:fields => [field1]) }

      context "and the model's field contain charactor other than number" do
        let(:values) { { field1.name => 'some chars 123' } }
        specify { model.should_not be_valid }
      end

      context "and the model's field contain only number" do
        let(:values) { { field1.name => '39387593873' } }
        specify { model.should be_valid }
      end
    end

    context 'when the form have a field that restrict max length' do
      let(:field1) { build_stubbed(:text_field, :max_length => 5) }
      let(:form) { stub(:fields => [field1]) }

      context "and the model's field exceed the max length" do
        let(:values) { { field1.name => 'longer than 5 char' } }
        specify { model.should_not be_valid }
      end

      context "and the model's field did not exceed the max length" do
        let(:values) { { field1.name => '12345' } }
        specify { model.should be_valid }
      end    
    end

    context 'when the form have a field that restrict min length' do
      let(:field1) { build_stubbed(:text_field, :min_length => 3) }
      let(:form) { stub(:fields => [field1]) }

      context "and the model's field did not reach the min length" do
        let(:values) { { field1.name => '12' } }
        specify { model.should_not be_valid }
      end

      context "and the model's field reached the min length" do
        let(:values) { { field1.name => '12345' } }
        specify { model.should be_valid }
      end    
    end
    
  end
end