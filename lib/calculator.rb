require 'pry'
class Calculator
  def self.result expression
    # eval expression # Test my tests
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
    # This regex captures numbers in one group, and any math operators in the other, also splits out parens
    @expression.scan(/([.\d]+)|([\/\+\-\*])|(\()|(\))/) do |number, op, open_paren, close_paren|
      if number
        output << number.to_f 
      elsif op
        op_stack.push op
      elsif open_paren
        op_stack.push open_paren
      elsif close_paren
        while op_stack.last && op_stack.last != "("
          output.push op_stack.pop
        end
        op_stack.pop
      end
    end

    output += op_stack.reverse

    output
  end
   
end
