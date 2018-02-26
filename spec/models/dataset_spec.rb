require 'rails_helper'

RSpec.describe Dataset, type: :model do
  it "is not valid without name and data_type" do
    dataset = Dataset.new(name: nil, data_type: nil)
    expect(dataset).to_not be_valid
  end

  it "is valid with name and data_type" do
    dataset = Dataset.new(name: "Kittens", data_type: "Pictures")
    expect(dataset).to be_valid
  end
end
