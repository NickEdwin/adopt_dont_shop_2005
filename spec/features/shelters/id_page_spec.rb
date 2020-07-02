require 'rails_helper'

RSpec.describe "shelters unique id page", type: :feature do
  it "can see return to shelter index link" do

    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link("Return to Shelter Index", :href=>"/shelters")
  end

  it "contains shelter information" do

    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter",
                              address: "123 Main St.",
                              city: "Denver",
                              state: "CO",
                              zip: 80218)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)


  end

  it "contains link to update information" do

    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link("Update Shelter", :href=>"/shelters/#{shelter_1.id}/edit")
  end

  it "Contains link to delete shelter" do

    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_button("Delete Shelter")
    # only way to test buttons path ? 
    expect(page).to have_link(:href=>"/shelters")
  end
end
