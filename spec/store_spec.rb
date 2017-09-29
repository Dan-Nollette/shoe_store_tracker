require("spec_helper")

describe(Store) do
  it("has many brands") do
    test_store = Store.create({:name => "Terribly important store"})
    test_brand1 = Brand.create({:name => "Kuds", :stores => [test_store]})
    test_brand2 = Brand.create({:name => "Udidus", :stores => [test_store]})
    expect(test_store.brands()).to(eq([test_brand1,test_brand2]))
  end


  describe ('#upcase_name') do
    it("upcases first letter of store name on save.") do
      store = Store.create({name: "bob"})
      expect(store.name).to(eq("Bob"))
    end
  end
end
