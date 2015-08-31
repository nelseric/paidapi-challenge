require 'spec_helper'

require 'calculator'

describe Calculator do

  context "Addition" do
    it "adds two numbers" do
      expect(Calculator.result("1+1")).to eq 2
    end
  end

  context "Subtraction" do
    it "subtracts two numbers" do
      expect(Calculator.result("5-1")).to eq 4
    end
  end

  context "Multiplication" do
    it "multiplies two numbers" do
      expect(Calculator.result("5*5")).to eq 25
    end
  end

  context "Division" do
    it "divides two numbers evenly" do
      expect(Calculator.result("10/5")).to eq 2
    end
    it "divides two numbers with a decimal result" do
      expect(Calculator.result("12.5/5")).to eq 2.5
    end
  end

  context "Multiple Operations" do
    it "adds many numbers" do
      expect(Calculator.result("1+2+3+4+1+2+3+4")).to eq 20
    end

    it "adds and subtracts numbers" do
      # skip
      expect(Calculator.result("1+2-3+4")).to eq 4
    end
  end

  context "Parentheses" do
    it "adds then subtracts" do
      expect(Calculator.result("(1+2)-(3+4)")).to eq -4
    end
  end
end