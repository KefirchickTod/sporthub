class Language < ApplicationRecord
  attribute :status, :boolean, default: true
  attribute :title, :string
end
