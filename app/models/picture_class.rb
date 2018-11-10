class PictureClass < ApplicationRecord
  belongs_to :project, inverse_of: :picture_classes
end
