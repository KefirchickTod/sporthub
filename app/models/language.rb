class Language < ApplicationRecord
  attribute :status, :boolean, default: true
  attribute :title, :string
  has_and_belongs_to_many :banners
end
