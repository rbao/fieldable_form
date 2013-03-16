module FieldableForm
  describe DropDown do
    
    let(:field) { build_stubbed(:drop_down) }
    subject { field }

    it { should respond_to :required, :include_blank, :items }
    it { should be_valid }

    describe '#required=' do
      before { field.required = 'changed' }

      it 'should be captured in the options' do
        field.options['required'].should eq 'changed'
        field.required.should eq 'changed'
        field.options_changed?.should eq true
      end
    end

    describe '#include_blank=' do
      before { field.include_blank = 'changed' }

      it 'should be captured in the options' do
        field.options['include_blank'].should eq 'changed'
        field.include_blank.should eq 'changed'
        field.options_changed?.should eq true
      end
    end

    describe '#items=' do
      before { field.items = 'changed' }

      it 'should be captured in the options' do
        field.options['items'].should eq 'changed'
        field.items.should eq 'changed'
        field.options_changed?.should eq true
      end
    end

    describe '#validators' do
      subject { field.validators }

      context 'when required is set' do
        before { field.required = '1' }
        it { should include_validator ActiveModel::Validations::PresenceValidator.new(:attributes => field.name) }
      end
    end

    describe '#render_options' do
      subject { field.render_options }

      context 'when include_blank is set' do
        before do
          field.include_blank = '1'
          field.items = 'a,b,c'
        end
        it { should eq [field.name, [['a', nil], ['b', 'b'], ['c', 'c']]] }
      end

      context 'when include_blank is not set' do
        before do
          field.items = 'a,b,c'
        end
        it { should eq [field.name, ['a', 'b', 'c']] }
      end
    end

  end
end