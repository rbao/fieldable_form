require 'spec_helper'

module FieldableForm
  describe TextField do

    let(:field) { build_stubbed(:text_field) }
    subject { field }

    it { should respond_to :required, :number_only, :min_length, :max_length }
    it { should be_valid }

    describe 'validations' do
      context 'when min_length is not a number' do
        before { field.min_length = 'invalid' }
        it { should_not be_valid }
      end

      context 'when max_length is not a number' do
        before { field.max_length = 'invalid' }
        it { should_not be_valid }
      end
    end

    describe '#required=' do
      before { field.required = 'changed' }

      it 'should be captured in the options' do
        field.options['required'].should eq 'changed'
        field.required.should eq 'changed'
        field.options_changed?.should eq true
      end
    end

    describe '#number_only=' do
      before { field.number_only = 'changed' }
      
      it 'should be captured in the options' do
        field.options['number_only'].should eq 'changed'
        field.number_only.should eq 'changed'
        field.options_changed?.should eq true
      end
    end

    describe '#min_length=' do
      before { field.min_length = 'changed' }
      
      it 'should be captured in the options' do
        field.options['min_length'].should eq 'changed'
        field.min_length.should eq 'changed'
        field.options_changed?.should eq true
      end
    end

    describe '#max_length=' do
      before { field.max_length = 'changed' }
      
      it 'should be captured in the options' do
        field.options['max_length'].should eq 'changed'
        field.max_length.should eq 'changed'
        field.options_changed?.should eq true
      end
    end

    describe '#validators' do
      subject { field.validators }

      context 'when required is set' do
        before { field.required = '1' }
        it { should include_validator ActiveModel::Validations::PresenceValidator.new(:attributes => field.name) }
      end

      context 'when number_only is set' do
        before { field.number_only = '1' }
        it { should include_validator ActiveModel::Validations::NumericalityValidator.new(:attributes => field.name, :only_integer => true) }
      end

      context 'when min_length is set' do
        before { field.min_length = (rand(10) + 10).to_s }
        it { should include_validator ActiveModel::Validations::LengthValidator.new(:attributes => field.name, :minimum => Integer(field.min_length)) }
      end

      context 'when max_length is set' do
        before { field.max_length = (rand(10) + 10).to_s }
        it { should include_validator ActiveModel::Validations::LengthValidator.new(:attributes => field.name, :maximum => Integer(field.max_length)) }
      end
    end

  end
end