class Picture < ApplicationRecord
  belongs_to :picture_class, required: false
  belongs_to :project
  validates :url, presence: true
  validates :rejected, inclusion: { in: [true, false] }
end
