class Project < ApplicationRecord
  has_many :pictures
  has_many :picture_classes

  validates :title, presence: true
end
