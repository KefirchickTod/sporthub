class Survey < ApplicationRecord
  has_many :survey_options, primary_key: 'surveys_id', foreign_key: "id", dependent: :destroy
end
