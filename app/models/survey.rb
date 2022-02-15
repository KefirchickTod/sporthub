class Survey < ApplicationRecord
  # Validation
  validates :question, presence: true
  validates :active_from, presence: true

  before_destroy :option_delete_all

  # Attributes
  attribute :question, :string
  attribute :active_from, :datetime
  attribute :active_to, :datetime

  has_many :options, primary_key: "id", foreign_key: "surveys_id", class_name: "SurveyOption", dependent: :destroy

  enum status: {
    unpublished: 0,
    published: 1,
    closed: 2
  }

  scope :published, -> { where("status = 1") }

  private

  # Before delete clean all connected options
  def option_delete_all
    options.each do |option|
      option.destroy
    end
  end
end
