require "phone_parser/version"
require "phone_parser/country_codes"

module PhoneParser
  include CountryCodes

  def self.parse(number)
    number.delete!("^0-9")
    digit_length_validator(number)
    country_code_validator(number)
  end

  def self.digit_length_validator number
    number.length < 10 ? (raise PhoneLengthError) : (number)
  end

  def self.country_code_validator number
    if number.length == 10
      number
    else
      extracted_number = number[-10..-1]
      country_code = number.gsub(extracted_number, '')

      country_codes.include?(country_code) ? (number) : (raise CountryCodeError)
    end
  end

  def self.country_codes
    CountryCodes.code_array.flatten.keep_if { |e| e =~ /\d+/ }
  end
end

class PhoneLengthError < StandardError
  def message
    'Phone numbers need to have at least 10 digits'
  end
end

class CountryCodeError < StandardError
  def message
    'Country code not recognized'
  end
end
