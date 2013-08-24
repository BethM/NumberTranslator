require 'number_translator'

# !!!!!!!!!!!!! DRY up before blocks

describe "NumberTranslator" do
  describe "translate" do

    context "one digit" do
      before do
        @number = 1
        @translator = NumberTranslator.new
        @translation = @translator.translate(@number)
      end

      it "returns a string" do
        expect(@translation).to be_a(String)
      end

      it "correctly translates a single digit number" do
        expect(@translation).to eq("one")
      end
    end

    context "two digits" do
      before do
        @translator = NumberTranslator.new
      end

      it "correctly translates a teen number" do
        number = 13
        translation = @translator.translate(number)
        expect(translation).to eq("thirteen")
      end

      it "correctly translates a number ending in 0" do
        number = 40
        translation = @translator.translate(number)
        expect(translation).to eq("forty")
      end

      it "correctly translates double digit numbers > 19" do
        number = 25
        translation = @translator.translate(number)
        expect(translation).to eq("twenty-five")
      end

      it "correctly translates a number starting with 0" do
        number = 03
        translation = @translator.translate(number)
        expect(translation).to eq("three")
      end
    end

    context "three digits" do
      before do
        @translator = NumberTranslator.new
      end

      it "correctly translates a three digit number" do
        number = 123
        translation = @translator.translate(number)
        expect(translation).to eq("one hundred twenty-three")
      end

      it "correctly translates a multiple of 100" do
        number = 500
        translation = @translator.translate(number)
        expect(translation).to eq("five hundred")
      end

      it "correctly translates a number with a 0 in the tens place" do
        number = 404
        translation = @translator.translate(number)
        expect(translation).to eq("four hundred four")
      end

      it "correctly translates a number starting with 0" do
        # need to assign "033".to_i to number because leading
        # zeros in numbers with more than 3 digits cause the
        # number not to be interpreted the way we want it to be
        number = "033".to_i
        translation = @translator.translate(number)
        expect(translation).to eq("thirty-three")
      end
    end
  end
end