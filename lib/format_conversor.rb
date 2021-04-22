class FormatConversor

    class InvalidFormatError < StandardError; end

    def convert(value, format)
        format = format.to_sym if format.is_a? String
        case(format)
        when :float
            convert_float(value)
        when :boolean
            convert_boolean(value)
        when :nil_3plus
            convert_nil_3plus(value)
        else
            raise InvalidFormatError
        end
    end

    def convert_float(value)
      value.to_f
    end
    
    def convert_boolean(value)
       value == 'NEGATIVE' ? -1.0 : -2.0
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