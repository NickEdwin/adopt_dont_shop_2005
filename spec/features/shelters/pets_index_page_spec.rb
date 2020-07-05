require 'rails_helper'

RSpec.describe "pets page", type: :feature do
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
                       description: "adorable",
                       adoption_status: "available"
                       )

    visit "/pets/#{pet_1.id}"

    expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content("Available for adoption:")
    expect(page).to have_content(pet_1.adoption_status)


  end
end
