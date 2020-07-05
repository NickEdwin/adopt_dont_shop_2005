require 'rails_helper'

RSpec.describe "pets page from shelter", type: :feature do
  it "contains pets information" do
    shelter_1 = Shelter.create(name: "Pawsitively Pawsome Animal Shelter",
                              address: "123 Main St.",
                              city: "Denver",
                              state: "CO",
                              zip: 80218)

    pet_1 = Pet.create(image: "cat.jpg",
                       name: "Kitty",
                       age: 9,
                       sex: "female",
                       shelter_id: shelter_1.id)

    visit "/shelters/#{shelter_1.id}/pets/new"

    expect(page).to have_field("image")
    expect(page).to have_field("name")
    expect(page).to have_field("description")
    expect(page).to have_field("age")
    expect(page).to have_field("sex")
    expect(page).to have_selector("input[type=submit]")

  end
end
