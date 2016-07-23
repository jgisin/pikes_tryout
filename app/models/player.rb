class Player < ApplicationRecord
  has_many :contacts

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
