class PieData
  attr_reader :project

  def initialize(project: project)
    @project = project
  end

  def to_json
    fetch.to_a.map do |item|
      { label: "#{item['label_name']}#{' (rejected)' if item['rejected']}",
        value: item['total'] }
    end.to_json
  end

  private

  def fetch
    raw_sql = <<-SQL
      select
        count(*) total,
        pc.name label_name,
        rejected
      from
        pictures
      left join
        picture_classes_pictures pcp on pcp.picture_id = pictures.id
      left join
        picture_classes pc on pcp.picture_class_id = pc.id
      where
        pictures.project_id = #{project.id}
      group by
        rejected,
        pc.id
    SQL
    ActiveRecord::Base.connection.execute(raw_sql)
  end
end
