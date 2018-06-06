class Card < ApplicationRecord
  belongs_to :user
  before_validation :load_defaults

  def load_defaults
    if self.new_record?
      length = 8
      self.card_number = SecureRandom.random_number(10000000000000000)
      self.cvv = SecureRandom.random_number(1000)
      self.status = "false"
    end
  end
end
