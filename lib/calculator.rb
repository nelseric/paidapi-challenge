require 'pry'
class Calculator
  def self.result expression
    new(expression).result
  end

  def initialize expression
    @expression = expression
  end

  def result
    expr = postfix_respression

    # binding.pry

    stack = []
    expr.each do |token|
      if token.is_a? Numeric
        stack.push token
      else
        case token
        when "+"
          b = stack.pop
          a = stack.pop
          stack.push a + b
        when "-"
          b = stack.pop
          a = stack.pop
          stack.push a - b
        when "*"
          b = stack.pop
          a = stack.pop
          stack.push a * b
        when "/"
          b = stack.pop
          a = stack.pop
          stack.push a / b
        else
          rails "#{token} was not caught"
        end
      end
    end
    stack.pop
  end

  def postfix_respression
    output = []
    op_stack = []
    # This regex captures numbers in one group, and any math operators in the other
    @expression.scan(/([.\d]+)|([\/\+\-\*()])/) do |number, op|

      output << number.to_f if number
      if op
        op_stack.push op
      end
    end

    output += op_stack.reverse

    output
  end
   
end
