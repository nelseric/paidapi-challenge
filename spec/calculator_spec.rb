require 'spec_helper'

require 'calculator'

describe Calculator do
  it "runs a test" do
    expect(true). to eq false
  end

  context "Addition" do
    skip
    it "adds two numbers" dos
    pass
      expect(Calculator.result("1+1")).to eql 2
    end
    it "adds many numbers" do
      pass
      expect(Calculator.result("1+2+3+4+1+2+3+4")).to eql 20
    end
  end

  context "Subtraction" do
    it "subtracts two numbers" do
      expect(Calculator.result("1+1")).to eql 2
    end
    it "adds and subtracts numbers" do
      expect(Calculator.result("1+2-3+4")).to eql 20
    end
  end

  context "Multiplication" do
    it "multiplies two numbers" do
      expect(Calculator.result("5*5")).to eql 25
    end
  end

  context "Division" do
    it "divides two numbers evenly" do
      expect(Calculator.result("10/5")).to eql 2.0
    end
    it "divides two numbers with a decimal result" do
      expect(Calculator.result("15/5")).to eql 2.5
    end
  end
end