class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError if first_operand.instance_of?(String)
    raise ArgumentError if second_operand.instance_of?(String)

    return 'Division by zero is not allowed.' if operation == '/' && second_operand.zero?

    result = case operation
             when '+'
               first_operand + second_operand
             when '*'
               first_operand * second_operand
             when '/'
               first_operand / second_operand
             else
               raise UnsupportedOperation
             end
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end

# class SimpleCalculator
#   class UnsupportedOperation < StandardError
#   end
#   ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
#   def self.calculate(first_operand, second_operand, operation)
#     raise ArgumentError if first_operand.instance_of?(String) || second_operand.instance_of?(String)
#     raise UnsupportedOperation unless ALLOWED_OPERATIONS.include? operation

#     begin
#       "#{first_operand} #{operation} #{second_operand} = #{first_operand.send(operation, second_operand)}"
#     rescue ZeroDivisionError => e
#       'Division by zero is not allowed.'
#     end
#   end
# end
