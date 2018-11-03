class Dataset < ApplicationRecord
  has_many :dataset_items

  validates :name, presence: true
  validates :data_type, presence: true
end
