require 'rails_helper'

RSpec.describe "new shelter page", type: :feature do
  it "contains instructional text" do

  visit "/shelters/new"

  expect(page).to have_content("Enter the new shelter's information:")
end

  it "contains new shelter input fields" do

    visit "/shelters/new"

    expect(page).to have_field("shelter[name]")
    expect(page).to have_field("shelter[address]")
    expect(page).to have_field("shelter[city]")
    expect(page).to have_field("shelter[state]")
    expect(page).to have_field("shelter[zip]")
  end

  it "contains button to submit information" do

    visit "/shelters/new"

    expect(page).to have_selector("input[type=submit]")
  end
end
