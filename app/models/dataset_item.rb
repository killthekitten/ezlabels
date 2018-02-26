class DatasetItem < ApplicationRecord
  belongs_to :dataset

  validates :url, presence: true
end
