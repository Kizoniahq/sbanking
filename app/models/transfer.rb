class Transfer < ApplicationRecord
  belongs_to :user
  belongs_to :account
  has_many :otps
  accepts_nested_attributes_for :otps

  before_validation :load_defaults

  def load_defaults
    if self.new_record?
      self.otp = SecureRandom.random_number(1000000)
      self.status = "In Progress"
    end
  end
end
