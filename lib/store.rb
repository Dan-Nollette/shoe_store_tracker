class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, {:presence => true,  uniqueness: true, :length => { :maximum => 100 }})
  before_save(:upcase_name)

private

  def upcase_name
    chars = self.name.split("")
    chars[0].upcase!
    self.name=chars.join("")
  end

end
