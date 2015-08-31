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

    binding.pry
  end

  def postfix_respression
    output = []
    op_stack = []
    @expression.scan(/([.\d]+)|([\+\-\*()])/) do |number, op|
      output << number.to_f if number
      if op
        op_stack.push op
      end
    end
  end
   
end
