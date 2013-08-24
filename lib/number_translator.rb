class NumberTranslator

  def translate(number)
    number_string = number.to_s
    number_of_digits = number_string.length

    case number_of_digits
    when 1
      digits[number.to_i][0]
    when 2
      two_digits(number_string)
    when 3
      three_digits(number_string)
    else
      "This application currently can only process numbers < 1000000000."
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
      return "#{ones}" if tens == nil
      "#{tens}-#{ones}"
    end
  end

  def three_digits(numbers)
    hundreds = digits[numbers[0].to_i][0]
    the_rest = two_digits(numbers[1..-1])
    if numbers[0] == "0"
      two_digits(numbers[1..-1])
    elsif numbers[1] && numbers[2] == "0"
      "#{hundreds} hundred"
    else
      "#{hundreds} hundred #{the_rest}"
    end
  end
end

translator = NumberTranslator.new
translated_number = translator.translate(ARGV[0])
puts translated_number