class Company < ApplicationRecord
  has_many :users

  validates :name, :domain, :country, presence: true
end
