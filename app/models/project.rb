class Project < ApplicationRecord
  TYPES = %w(image_classification).freeze
  SAMPLE_SIZE = 50

  self.inheritance_column = :_type_disabled

  has_many :pictures
  has_many :picture_classes, inverse_of: :project

  validates :title, presence: true
  validates :type, presence: true

  accepts_nested_attributes_for :picture_classes, reject_if: :all_blank

  def generate_samples_for(user)
    ActiveRecord::Base.connection.execute <<-SQL
      update
        pictures
      set
        user_id = #{user.id}
      where
        id in (
          select
            id
          from
            pictures
          where
            pictures.user_id is null and
            project_id = #{id}
          order by
            random()
          limit
            #{SAMPLE_SIZE}
        ) and
        project_id = #{id}
    SQL
  end

  def pie_data
    @pie_data ||= PieData.new(project: self)
  end
end
