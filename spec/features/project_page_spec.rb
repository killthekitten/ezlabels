require 'rails_helper'

feature "Projects" do
  before(:each) do
    @user = create(:user)
    sign_in(@user)
  end

  it "creates project" do
    visit root_path
    click_on("Create new")
    fill_in('Title', :with => 'Sample Project')
    fill_in('Content', :with => 'Awesome project')
    click_button("Create Project")
    expect(page).to have_content("Project was successfully created.")
  end
end
