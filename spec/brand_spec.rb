require("spec_helper")

describe(Brand) do
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
