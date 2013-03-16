RSpec::Matchers.define :include_validator do |expected_validator|
  match do |array_of_validators|
    array_include_validator?(array_of_validators, expected_validator)
  end

  def array_include_validator?(array, validator)
    array.each do |v|
      return true if v.class == validator.class
                     v.attributes == validator.attributes &&
                     v.options == validator.options
    end
    false
  end
end