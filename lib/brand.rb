class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, {:presence => true,  uniqueness: true, :length => { :maximum => 100 }})
  before_save(:upcase_name)

  def currency_string
    if self.price.zero?
      return "0.00"
    end
    cents_string = (self.price.round(2) * 100).to_i.to_s
    cents_string.insert(cents_string.length - 2, ".")
  end

private

  def upcase_name
    chars = self.name.split("")
    chars[0].upcase!
    self.name=chars.join("")
  end
end
