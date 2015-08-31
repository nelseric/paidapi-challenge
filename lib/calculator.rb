require 'pry'
class Calculator
  def self.result expression
    new(expression).result
  end

  def initialize expression
    @expression = expression
  end

  def result
    expr = postfix_expression

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
          raise "unexpected token: '#{token}'"
        end
      end
    end
    stack.pop
  end

  ORD_OF_OPS = {
    "*" => 0,
    "/" => 0,
    "+" => 2,
    "-" => 2
  }

  def postfix_expression
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
