require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see shelters index" do
    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter")
    shelter_2 = Shelter.create(name: "Raise the Ruff Animal Shelter")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)

  end

  it "contains a New Shelter Button" do

    visit "/shelters"

    expect(page).to have_link("New Shelter", :href=>"/shelters/new")
  end
end
