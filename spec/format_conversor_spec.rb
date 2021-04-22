RSpec.describe FormatConversor do

    it "properly converts a float value" do 
        value = "20.0"
        conversor = FormatConversor.new
        expect(conversor.convert(value, :float)).to eq(20.0)
    end

    it "properly converts a boolean value" do 
        negative_value = "NEGATIVE"
        positive_value = "POSITIVE"
        conversor = FormatConversor.new
        expect(conversor.convert(negative_value, :boolean)).to eq(-1.0)
        expect(conversor.convert(positive_value, :boolean)).to eq(-2.0)
    end
    
    it "properly converts a nil_3plus value" do 
        nil_value = 'NIL'
        one_plus_value = '+'
        two_plus_value ='++'
        three_plus_value = '+++'
        conversor = FormatConversor.new
        expect(conversor.convert(nil_value, :nil_3plus)).to eq(-1.0)
        expect(conversor.convert(one_plus_value, :nil_3plus)).to eq(-2.0)
        expect(conversor.convert(two_plus_value, :nil_3plus)).to eq(-2.0)
        expect(conversor.convert(three_plus_value, :nil_3plus)).to eq(-3.0)
    end

    it "raises an error in case of non-existent format provided" do 
        value = "20.0"
        conversor = FormatConversor.new
        expect{conversor.convert(value, :integer)}.to raise_error(FormatConversor::InvalidFormatError)
    end
end
  