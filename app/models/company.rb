class Company < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :projects

  validates :name, :domain, :country, presence: true
end
