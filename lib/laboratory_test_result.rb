

class LaboratoryTestResult 

    attr_reader :code, :result, :format, :comment
    def initialize(code: "", result: "", format: "", comment: "")
        @code = code
        @format = format
        @comment = comment
        @result = convert_result(format, result)
    end

    private
    
    def convert_result(format, value)
        case(format)
        when :float
            return value.to_f
        when :boolean
            return convert_boolean(value)
        when :nil_3plus
            return convert_nil_3plus(value)
        else
            return ''
        end
    end

    def convert_boolean(value)
        return value == 'NEGATIVE' ? -1.0 : -2.0
    end
    
    def convert_nil_3plus(value)
        if value == 'NIL'
            return -1.0
        elsif value == '+' || value == "++"
            return -2.0
        end
        return -3.0 
    end
end