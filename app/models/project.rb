class Project < ApplicationRecord
  SAMPLE_SIZE = 50

  has_many :pictures
  has_many :picture_classes

  validates :title, presence: true

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
            pictures.user_id is null
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
