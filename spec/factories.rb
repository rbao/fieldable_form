def random_options
  r = ""
  10.times { r += Faker::Name.first_name + "," }
  r
end

FactoryGirl.define do
  factory :base_form, :class => FieldableForm::BaseForm do
  end

  factory :abstract_field, :class => FieldableForm::AbstractField do
    sequence(:name) { |n| "abstract_field_#{n}" }

    trait :with_form do
      association :fieldable, :factory => [:base_form]
    end

    trait :select do
      field_type 'select'
      options_for_select { random_options }
    end

    trait :number_only do
      number_only true
    end
  end

  factory :text_field, :class => FieldableForm::TextField do
    sequence(:name) { |n| "text_field_#{n}" }

    trait :required do
      required '1'
    end

    trait :number_only do
      number_only '1'
    end

    trait :with_form do
      association :fieldable, :factory => [:base_form]
    end
  end

  factory :drop_down, :class => FieldableForm::DropDown do
    sequence(:name) { |n| "drop_down_#{n}" }

    trait :required do
      required '1'
    end

    trait :include_blank do
      include_blank '1'
    end
  end
end