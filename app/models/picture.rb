class Picture < ApplicationRecord
  has_and_belongs_to_many :picture_classes
  belongs_to :project
  validates :url, presence: true
  validates :rejected, inclusion: { in: [true, false] }
end
