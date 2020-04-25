require_relative "../french_ssn"

describe "#french_ssn_info" do
  it "returns 'The number is invalid' when passed an empty string" do
    actual = french_ssn_info("")
    expected = "The number is invalid"
    expect(actual).to eq(expected)
  end

  it "returns 'The number is invalid' when passed an bad SSN" do
    actual = french_ssn_info('1 01 13 73 231 199 22')
    expected = "The number is invalid"
    expect(actual).to eq(expected)
  end

  it "returns 'a man, born in December, 1984 in Seine-Maritime.' when passed '1 84 12 76 451 089 46'" do
    actual = french_ssn_info("1 84 12 76 451 089 46")
    expected = "A man, born in December, 1984 in Seine-Maritime."
    expect(actual).to eq(expected)
  end
end
