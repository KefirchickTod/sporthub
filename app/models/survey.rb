class Survey < ApplicationRecord
  has_many :survey_options, primary_key: "surveys_id", foreign_key: "id", dependent: :destroy

  enum status: {
    unpublished: 0,
    published: 1,
    closed: 2
  }
end
