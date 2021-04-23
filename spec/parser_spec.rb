RSpec.describe Parser do

  it 'responds to mapped_result' do 
    filename = 'lab_result.txt'
    file_content = ''
    allow(File).to receive(:read).with(filename).and_return(file_content)
    parser = Parser.new(filename)
    expect(parser).to respond_to(:mapped_results)
  end

  context 'given a blank file as input' do 
    it 'returns an empty array' do 
      filename = 'lab_result.txt'
      file_content = ''
      allow(File).to receive(:read).with(filename).and_return(file_content)
      parser = Parser.new(filename)
      expect(parser.mapped_results).to eq([])
    end
  end
  
  context 'given the first laboratory example' do 
    it 'correctly maps the file to an array of LaboratoryTestResults' do 
      filename = 'lab_result.txt'
      file_content = 'OBX|1|C100|20.0|'\
                     'NTE|1|Comment for C100 result|'
      expected_result = [
        LaboratoryTestResult.new(code: 'C100', result: 20.0, format: 'float', comment: 'Comment for C100 result')
      ]

      allow(File).to receive(:read).with(filename).and_return(file_content)

      parser = Parser.new(filename)
      expect(parser.mapped_results).to match_array([
        have_attributes(code: 'C100', result: 20.0, format: 'float', comment: 'Comment for C100 result'),
      ])
      
    end
  end
  
  context 'given the second laboratory example' do 
    it 'correctly maps the file to an array of LaboratoryTestResults' do
      filename = 'lab_result.txt'
      file_content = 'OBX|1|A250|NEGATIVE|'\
                     'NTE|1|Comment for NEGATIVE result|'\
                     'OBX|2|B250|++|'\
                     'NTE|2|Comment 1 for ++ result|'\
                     'NTE|2|Comment 1 for ++ result|'
      expected_result = [
        LaboratoryTestResult.new(code: 'A250', result: -1.0, format: 'boolean', comment: 'Comment for NEGATIVE result'),
        LaboratoryTestResult.new(code: 'B250', result: -2.0, format: 'nil_3plus', comment: "Comment 1 for ++ result\nComment 1 for ++ result")
      ]

      allow(File).to receive(:read).with(filename).and_return(file_content)

      parser = Parser.new(filename)
      expect(parser.mapped_results).to match_array([
        have_attributes(code: 'A250', result: -1.0, format: 'boolean', comment: 'Comment for NEGATIVE result'),
        have_attributes(code: 'B250', result: -2.0, format: 'nil_3plus', comment: "Comment 1 for ++ result\nComment 1 for ++ result"),
      ])
    end
  end
end
