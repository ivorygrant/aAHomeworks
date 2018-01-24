require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:carrotcake) { Dessert.new('Carrot Cake', 50, 'Haroon')}
  #why does solution use let? what's the difference.
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(carrotcake.type).to eq('Carrot Cake')
    end

    it "sets a quantity" do
      expect(carrotcake.quantity). to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(carrotcake.ingredients). to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect(carrotcake.quantity). to eq(50)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(carrotcake.ingredients).to_not include('Carrots')
      carrotcake.add_ingredient('Carrots')
      expect(carrotcake.ingredients).to include('Carrots')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['Carrots', 'flour', "dates", "coconut"]
      ingredients.each do |ingredient|
        carrotcake.add_ingredient(ingredient)
      end
      expect(carrotcake.ingredients).to eq(ingredients)
      carrotcake.mix!
      expect(carrotcake.ingredients).not_to eq(ingredients)
      expect(carrotcake.ingredients.sort).to eq(ingredients.sort) #why I need to sort again?
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      carrotcake.eat(5) #add this line because you're calling it first
      expect(carrotcake.quantity).to eq(45)

      #expect(carrotcake.eat(5).to eq(45) #is this good code?
    end

    it "raises an error if the amount is greater than the quantity" do
      # carrotcake.eat(46)
      # expect(carrotcake.quantity).to raise_error("not enough left!") why is block needed?
      expect {carrotcake.eat(100)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      # expect(carrotcake.serve).to eq("Haroon has made...")
      allow(chef).to receive(:titleize).and_return("Chef Haroon the Great Baker")
      expect(carrotcake.serve).to eq("Chef Haroon the Great Baker has made 50 Carrot Cakes!") #error here
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).and_return(:carrotcake) #different from solution
    end
  end
end
