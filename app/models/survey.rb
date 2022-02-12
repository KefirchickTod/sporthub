class Survey < ApplicationRecord
  # Validation
  validates :question, presence: true
  validates :active_from, presence: true

  # Attributes

  attribute :question, :string
  attribute :active_from, :datetime
  attribute :active_to, :datetime

  has_many :survey_options, primary_key: "surveys_id", foreign_key: "id", dependent: :destroy

  enum status: {
    unpublished: 0,
    published: 1,
    closed: 2
  }
end
