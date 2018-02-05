class Picture < ApplicationRecord
  has_and_belongs_to_many :picture_classes
  belongs_to :project
  belongs_to :user, required: false
  validates :url, presence: true
  validates :rejected, inclusion: { in: [true, false] }

  scope :uninspected_for, ->(user) { where(inspected: false, user: user) }
end
