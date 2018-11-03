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
        labels
      left join
        label_classes_project_labels pcp on pcp.label_id = labels.id
      left join
        label_classes pc on pcp.label_class_id = pc.id
      where
        labels.project_id = #{project.id}
      group by
        rejected,
        pc.id
    SQL
    ActiveRecord::Base.connection.execute(raw_sql)
  end
end
