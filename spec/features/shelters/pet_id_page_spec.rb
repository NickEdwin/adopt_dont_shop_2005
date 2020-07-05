require 'rails_helper'

RSpec.describe "pet id page", type: :feature do
  it "contains pet information" do
    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter",
                              address: "123 Main St.",
                              city: "Denver",
                              state: "CO",
                              zip: 80218)

    pet_1 = Pet.create(image: "cat1.jpg",
                       name: "Kitty",
                       age: 9,
                       sex: "female",
                       shelter_id: shelter_1.id,
                       description: "A tiny cat.",
                       adoption_status: "Adoptable")

    visit "/pets/#{pet_1.id}"

    expect(page).to have_css("img[src*='cat1.jpg']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content("Status:")
    expect(page).to have_content(pet_1.adoption_status)
  end

  it "contains a Delete Button" do
    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter",
                              address: "123 Main St.",
                              city: "Denver",
                              state: "CO",
                              zip: 80218)

    pet_1 = Pet.create(image: "cat1.jpg",
                       name: "Kitty",
                       age: 9,
                       sex: "female",
                       shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    expect(page).to have_button("Delete Pet")
  end

  it "contains an Update Link" do
    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter",
                              address: "123 Main St.",
                              city: "Denver",
                              state: "CO",
                              zip: 80218)

    pet_1 = Pet.create(image: "cat1.jpg",
                       name: "Kitty",
                       age: 9,
                       sex: "female",
                       shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    expect(page).to have_link("Update Pet", :href=>"/pets/#{pet_1.id}/edit")

  end
end
