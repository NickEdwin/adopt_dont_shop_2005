require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see shelters index" do
    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter")
    shelter_2 = Shelter.create(name: "Raise the Ruff Animal Shelter")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_link("#{shelter_1.name}", :href=>"/shelters/#{shelter_1.id}")
    expect(page).to have_link("#{shelter_1.name}", :href=>"/shelters/#{shelter_1.id}")
  end

  it "Link to edit shelter" do
    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter")

    visit "/shelters"

    expect(page).to have_link("Edit #{shelter_1.name}'s Information", :href=>"/shelters/#{shelter_1.id}/edit")
  end

  it "contains a New Shelter Link" do

    visit "/shelters"

    expect(page).to have_link("New Shelter", :href=>"/shelters/new")
  end

  it "contains a Delete Button" do
    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter")

    visit "/shelters"

    expect(page).to have_button("Delete #{shelter_1.name}")
  end
end
