class Banner < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :languages

  enum status: {
    unpublished: 0,
    published: 1,
    closed: 2
  }
end
