# coding: utf-8
$LOAD_PATH << File.dirname(__FILE__)
require "fizz"

describe Fizz do
  describe "#print" do
    it "引数に1を渡した場合、1を返すこと" do
      fizz = Fizz.new
      fizz.print(1).should eq 1
    end

    it "引数に3を渡した場合、fizzを返すこと" do
      fizz = Fizz.new
      fizz.print(3).should eq "fizz"
    end

    it "引数に5を渡した場合、buzzを返すこと" do
      fizz = Fizz.new
      fizz.print(5).should eq "buzz"
    end

    it "引数に15を渡した場合、fizzbuzzを返すこと" do
      fizz = Fizz.new
      fizz.print(15).should eq "fizzbuzz"
    end
  end

  describe "solve" do
    it "引数に1, 15を渡した場合、1から15までのfizzbuzzを返すこと" do
      fizz = Fizz.new
      res = [
        1,
        2,
        "fizz",
        4,
        "buzz",
        "fizz",
        7,
        8,
        "fizz",
        "buzz",
        11,
        "fizz",
        13,
        14,
        "fizzbuzz"
      ]
      fizz.solve(1, 15).should eq res
    end
  end
end
