require 'pry'
require_relative './laboratory_test_result'
require_relative './format_conversor'

class Parser 

  DELIMITER = "|"
  LAB_RESULT_START_TOKEN = "OBX|"
  LAB_COMMENT_START_TOKEN = "NTE|"

  TEST_TYPES = {
    C100: "float",
    C200: "float",
    A250: "boolean",
    B250: "nil_3plus"
  }


  def initialize(file_path)
    content = File.read(file_path).gsub("\n", "")
    @conversor = FormatConversor.new
    @lab_tests = map_tests(content)
  end 
  
  def mapped_results
    mapped_results = []
    @lab_tests.map do |test|
      result = extract_test_result(test.shift)
      comment = extract_comment(test)
      LaboratoryTestResult.new(code: result[:code], 
                               result: result[:result],
                               format: result[:format],
                               comment: comment
      )
    end
  end

  private 

  def map_tests(tests_string)
    mapped_tests = tests_string.split(LAB_RESULT_START_TOKEN)  
    mapped_tests.shift
    return mapped_tests.map{|e| e.split(LAB_COMMENT_START_TOKEN)}
  end
  
  def extract_test_result(test_string)
    test = test_string.split(DELIMITER)
    code = test[1]
    result = test[2]
    format = TEST_TYPES.fetch(code.to_sym)
    return { format: format,
             code: code,
             result: @conversor.convert(result, format)
    }
  end
  
  def extract_comment(array_of_comments)
    return array_of_comments.map{|e| e.split(DELIMITER).last}.join("\n")
  end

end
