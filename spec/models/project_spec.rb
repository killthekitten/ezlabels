require 'rails_helper'

RSpec.describe Project, type: :model do
  it "is not valid without title" do
    project = Project.new(title: nil)
    expect(project).to_not be_valid
  end

  it "is valid with title" do
    project = Project.new(title: "Awesome project")
    expect(project).to be_valid
  end
end
