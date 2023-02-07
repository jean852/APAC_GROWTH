class Company < ApplicationRecord
  has_many :users, dependent: :nullify

  validates :name, :domain, :country, presence: true
end
