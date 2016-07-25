class Contact < ApplicationRecord
  belongs_to :player

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
