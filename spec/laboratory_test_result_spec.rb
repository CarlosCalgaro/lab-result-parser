RSpec.describe LaboratoryTestResult do

    let(:attributes){ {code: "C100", result: 20.0, format: "float", comment: "just a comment"} }

    it "populates all attributes on intialization" do 
        lab_test = LaboratoryTestResult.new( code: attributes[:code], 
                                            result: attributes[:result], 
                                            format: attributes[:format], 
                                            comment: attributes[:comment]
                                            )
        expect(lab_test.code).to eq(attributes[:code])
        expect(lab_test.result).to eq(attributes[:result])
        expect(lab_test.format).to eq(attributes[:format])
        expect(lab_test.comment).to eq(attributes[:comment])
    end
end
  