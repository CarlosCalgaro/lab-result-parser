require 'pry'
require_relative './laboratory_test_result'
require_relative './laboratory_test_constants'

# Class used to parse test results given an export file
class Parser 

  include LaboratoryTestConstants
  include LaboratoryTestConstants::FileImport

  VERSION = 1.0

  # Read the file and initializes an array with every laboratory test
  def initialize(file_path)
    content = File.read(file_path).gsub("\n", "")
    @laboratory_tests = split_tests(content)
  end 
  
  def mapped_results
    return_data = []
    @laboratory_tests.each do |test|
      test = test.split(LAB_COMMENT_START_TOKEN)
      test_result = extract_test_result(test.shift)
      comments = extract_comments(test)
      return_data.push(
            LaboratoryTestResult.new(code: test_result[:code], 
                                     result: test_result[:result], 
                                     format: test_result[:format], 
                                     comment: comments)
      )
    end
    return_data
  end

  private 

  #Given a bulk string of tests, returns an array of tests splitten by a delimiter
  def split_tests(bulk_test_string)
    array_of_tests = bulk_test_string.split(DELIMITER)  
    array_of_tests.shift
    return array_of_tests
  end
  
  #Receives a test result string and return the test data formatted
  def extract_test_result(laboratory_result_string)
    tokens = laboratory_result_string.split(DELIMITER)
    return { 
      code: tokens[1], 
      result: tokens[2], 
      format: FORMATS.fetch(tokens[1].to_sym), 
    }
  end
  
  # Receive an array of comments string and returns the parsed string
  def extract_comments(tokens)
    tokens.collect{|e| e.split(DELIMITER).last}.join("\n")
  end

end
