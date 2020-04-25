require 'date'
require 'yaml'

# Example: 1 84 12 76 451 089 46
# Example: s yy mm ll ooo kkk cc

# s = 1(male) or 2(female)
# yy = last 2 digitis of birth year
# mm = month of birth
# ll = number of the départment of origin
# ooo = commune of origin
# kkk = order number to distinguish people being born at the same place in the same year and month.
# cc = "control key"

def french_ssn_info(ssn)
  # TODO: Create a method which will return a sentence about a person based on their SSN
  # eg: "A man, born in January, 1949 in Haute-Garonne."
  ssn_pattern = /(?<gender>1|2)\s(?<year>\d{2})\s(?<month>0[1-9]{1}|1[0-2]{1})\s(?<dept>\d{2})\s\d{3}\s\d{3}\s\d{2}/

  if ssn == '' || !ssn.match(ssn_pattern)
    return "The number is invalid"
  end

  match_data = ssn.match(ssn_pattern)
  sex = gender(match_data[:gender])
  year = "19#{match_data[:year]}"
  month = month(match_data[:month])
  dept = department(match_data[:dept])

  return "A #{sex}, born in #{month}, #{year} in #{dept}."
end

def month(code)
  Date::MONTHNAMES[code.to_i]
end

def gender(code)
  code == '1' ? "man" : "woman"
end

def department(code)
  # Returns the name of the French department which matches the given code, eg: '05'=> Hautes-Alpes
  YAML.load_file('./data/french_departments.yml')[code]
end
