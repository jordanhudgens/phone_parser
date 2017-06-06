require "spec_helper"

describe PhoneParser do
  it "has a version number" do
    expect(PhoneParser::VERSION).not_to be nil
  end

  it 'can parse any US based phone number in various formats and adds a default country code of 1' do
    expect(PhoneParser.parse('555-555-5555')).to eq('15555555555')
    expect(PhoneParser.parse('5555555555')).to eq('15555555555')
    expect(PhoneParser.parse('(555) 555-5555')).to eq('15555555555')
    expect(PhoneParser.parse('555.555.5555')).to eq('15555555555')
    expect(PhoneParser.parse('555 555.5555')).to eq('15555555555')
    expect(PhoneParser.parse('555 555.5555')).to eq('15555555555')
  end

  it 'informs the client if there are too few or too many digits' do
    expect{ PhoneParser.parse('5555555') }.to raise_error(PhoneLengthError)
    expect{ PhoneParser.parse('') }.to raise_error(PhoneLengthError)
  end

  it 'allows a valid country code to be supplied' do
    expect(PhoneParser.parse('+15555555555')).to eq('15555555555')
    expect(PhoneParser.parse('1-7845555555555')).to eq('17845555555555')
    expect(PhoneParser.parse('Country Code: 379, Phone:  555-555-5555')).to eq('3795555555555')
  end

  it 'can be passed a different default country code' do
    expect(PhoneParser.parse('555-555-5555', country_code: '379')).to eq('3795555555555')
  end

  it 'raises an error if an invalid country code is supplied' do
    expect{ PhoneParser.parse('999 555 555 5555') }.to raise_error(CountryCodeError)
  end

  it 'can verify if a phone number belongs to a specific country' do
    expect(CountryCodes.va?('379 555-555-5555')).to eq(true)
    expect(CountryCodes.us?('379 555-555-5555')).to eq(false)
  end

  it 'returns the country code' do
    expect(CountryCodes.country_code('379 555-555-5555')).to eq('379')
    expect(CountryCodes.country_code('1 555-555-5555')).to eq('1')
  end
end
