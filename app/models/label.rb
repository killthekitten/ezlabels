class Label < ApplicationRecord
  has_and_belongs_to_many :label_class
  belongs_to :project
  belongs_to :user, required: false
  validates :url, presence: true
  validates :rejected, inclusion: { in: [true, false] }

  scope :uninspected_for, ->(user) { where(inspected: false, user: user) }

  audited
end
