require("spec_helper")

describe(Brand) do
  describe('#currency_string') do
    it("returns the price in a string form that is currency friendly") do
      brand =Brand.create({price: 1.0267, name: "Bob"})
      expect(brand.currency_string).to(eq("1.03"))
    end
    it("returns the price in a string form that is currency friendly") do
      brand =Brand.create({price: 0.0, name: "Bob"})
      expect(brand.currency_string).to(eq("0.00"))
    end
    it("returns the price in a string form that is currency friendly") do
      brand =Brand.create({price: 0.0043, name: "Bob"})
      expect(brand.currency_string).to(eq("0.00"))
    end
    it("returns the price in a string form that is currency friendly") do
      brand =Brand.create({price: 1000.0, name: "Bob"})
      expect(brand.currency_string).to(eq("1000.00"))
    end
  end

  describe ('#upcase_name') do
    it("upcases first letter of brand name on save.") do
      brand =Brand.create({price: 1.0267, name: "bob"})
      expect(brand.name).to(eq("Bob"))
    end
  end

  it("has many stores") do
    test_brand = Brand.create({:name => "Terribly important brand"})
    test_store1 = Store.create({:name => "Boot Locker", :brands => [test_brand]})
    test_store2 = Store.create({:name => "Lady Boot Locker", :brands => [test_brand]})
    expect(test_brand.stores()).to(eq([test_store1,test_store2]))
  end
end
