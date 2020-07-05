require 'rails_helper'

RSpec.describe "pets page from shelter", type: :feature do
  it "contains pets information" do
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

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.adoption_status)
  end

  it "contains button to add new pet" do
    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter",
                              address: "123 Main St.",
                              city: "Denver",
                              state: "CO",
                              zip: 80218)

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_link("Create Pet", :href=>"/shelters/#{shelter_1.id}/pets/new")
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

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_button("Delete #{pet_1.name}")
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

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_link("Edit #{pet_1.name}'s Information", :href=>"/pets/#{pet_1.id}/edit")
  end
end
