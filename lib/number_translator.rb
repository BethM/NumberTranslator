class NumberTranslator

  def translate(number)
    number_string = number.to_s
    number_of_digits = number_string.length

    if number_of_digits == 1
      digits[number.to_i][0]
    else
      two_digits(number_string)
    end
  end

  def digits
    {
        0 => ["zero", "ten"],
        1 => ["one", "eleven"],
        2 => ["two", "twelve", "twenty"],
        3 => ["three", "thirteen", "thirty"],
        4 => ["four", "fourteen", "forty"],
        5 => ["five", "fifteen", "fifty"],
        6 => ["six", "sixteen", "sixty"],
        7 => ["seven", "seventeen", "seventy"],
        8 => ["eight", "eighteen", "eighty"],
        9 => ["nine", "nineteen", "ninety"]
    }
  end

  def two_digits(numbers)
    if numbers[0] == "1"
      digits[numbers[1].to_i][1]
    elsif numbers[1] == "0"
      digits[numbers[0].to_i][2]
    else
      tens =  digits[numbers[0].to_i][2]
      ones =  digits[numbers[1].to_i][0]
      "#{tens}-#{ones}"
    end
  end
end

translator = NumberTranslator.new
translated_number = translator.translate(ARGV[0])
puts translated_number