require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new("Sunday", 20, chef) }
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('Sunday')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(20)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("Fudge", "10", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.add_ingredient("Salt")).to include("Salt")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ["A","B", "C", "D"].each do |ing|
        dessert.add_ingredient(ing)
      end
      expect(dessert.mix!).to_not eq(["A","B", "C", "D"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(11)
      expect(dessert.quantity).to eq(9)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(21)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize).and_return("Chef Matt")
      expect(dessert.serve).to eq("Chef Matt has made 20 Sundays!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
