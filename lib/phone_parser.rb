require "phone_parser/version"
require "phone_parser/country_codes"

module PhoneParser
  def self.parse(number, country_code: '1')
    number.delete!("^0-9")
    digit_length_validator(number)
    CountryCodes.country_code_validator(number, country_code)
  end

  def self.digit_length_validator number
    number.length < 10 ? (raise PhoneLengthError) : (number)
  end
end

class PhoneLengthError < StandardError
  def message
    'Phone numbers need to have at least 10 digits'
  end
end

