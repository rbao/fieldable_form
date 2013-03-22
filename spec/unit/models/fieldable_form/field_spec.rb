require 'spec_helper'

module FieldableForm

  class ConcreteField < Field
  end

  describe Field do

    let(:field) { ConcreteField.new }
    subject { field }

    describe 'attribtues and associations' do
      it { should respond_to :name }
      it { should respond_to :options }
      it { should respond_to :fieldable }
      it { should respond_to :type }
    end

    describe '.new' do
      context 'when type is not supplied' do
        it 'should raise an exception' do
          expect { Field.new }.to raise_error(CannotInitializeAbstractClass)
        end
      end

      context "when a type is supplied but is not one of Field's descendants" do
        it 'should raise an exception' do
          expect { Field.new(:type => 'invalid') }.to raise_error(CannotInitializeAbstractClass)
        end
      end

      context 'when descendant type is given' do
        it 'should create an instance of that descendant' do
          Field.new(:type => 'FieldableForm::TextField').should be_instance_of(TextField)
        end
      end
    end
  
  end
end