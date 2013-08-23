require 'number_translator'

# !!!!!!!!!!!!! DRY up before blocks

describe "NumberTranslator" do
  describe "translate" do

    context "single digits" do
      before do
        @number = 1
        @translator = NumberTranslator.new
        @translation = @translator.translate(@number)
      end

      it "returns a string" do
        expect(@translation).to be_a(String)
      end

      it "correctly translate a single digit number" do
        expect(@translation).to eq("one")
      end
    end
  end
end