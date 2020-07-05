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
                       shelter_id: shelter_1.id)

    visit "/pets/"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
  end
end
