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
