class NumberTranslator

  def translate(number)
    ones_hash = {
        0 => "zero",
        1 => "one",
        2 => "two",
        3 => "three",
        4 => "four",
        5 => "five",
        6 => "six",
        7 => "seven",
        8 => "eight",
        9 => "nine"
    }

    ones_hash[number.to_i]
  end
end

translator = NumberTranslator.new
translated_number = translator.translate(ARGV[0])
puts translated_number