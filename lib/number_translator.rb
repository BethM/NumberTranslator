#!/usr/bin/env ruby
class NumberTranslator
  def translate(number)
    error_message = "This application currently can only process numbers with fewer than 10 digits. It also does not yet handle text, negative numbers or decimals. Please try again."
    if number == "0"
      "zero"
    else
      return error_message if number.to_i == 0 || number.to_s.include?(",") || number.to_s.include?("-") || number.to_s.include?(".")
    end

    number_string = number.to_s.gsub(",", "")
    number_of_digits = number_string.length

    case number_of_digits
    when 1
      one_digit(number_string)
      when 2
      two_digits(number_string)
      when 3
      three_digits(number_string)
      when 4, 5, 6
      thousands(number_string)
      when 7, 8, 9
      millions(number_string)
      else
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

  def one_digit(number)
    digits[number.to_i][0]
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
    tens = two_digits(numbers[1..-1])
    if numbers[0] == "0"
      two_digits(numbers[1..-1])
    elsif numbers[1] == "0" && numbers[2] == "0"
      "#{hundreds} hundred"
    else
      "#{hundreds} hundred #{tens}"
    end
  end

  def thousands(numbers)
    return nil if numbers.to_i == 0
    hundreds = three_digits(numbers.reverse[0..2].reverse)
    thousands = if numbers.length == 4
                  one_digit(numbers[0])
                elsif numbers.length == 5
                  two_digits(numbers[0..1])
                else
                  three_digits(numbers[0..2])
                end
    if thousands == "zero"
      "#{hundreds}"
    else
      "#{thousands} thousand #{hundreds}"
    end
  end

  def millions(numbers)
    return nil if numbers.to_i == 0
    thousands_numbers = numbers.reverse[0..5].reverse
    thousands = thousands(thousands_numbers)
    millions = if numbers.length == 7
                 one_digit(numbers[0])
               elsif numbers.length == 8
                 two_digits(numbers[0..1])
               else
                 three_digits(numbers[0..2])
               end
    if millions == "zero"
      "#{thousands}"
    elsif thousands_numbers.to_i == 0
      "#{millions} million"
    else
      "#{millions} million #{thousands}"
    end
  end
end

translator = NumberTranslator.new
translated_number = translator.translate(ARGV[0])
puts translated_number