require "application_system_test_case"

class KoalasTest < ApplicationSystemTestCase
  setup do
    @koala = koalas(:one)
  end

  test "visiting the index" do
    visit koalas_url
    assert_selector "h1", text: "Koalas"
  end

  test "creating a Koala" do
    visit koalas_url
    click_on "New Koala"

    fill_in "Character", with: @koala.character
    fill_in "Colour", with: @koala.colour
    fill_in "Dob", with: @koala.dob
    fill_in "Favourite food", with: @koala.favourite_food
    fill_in "Name", with: @koala.name
    click_on "Create Koala"

    assert_text "Koala was successfully created"
    click_on "Back"
  end

  test "updating a Koala" do
    visit koalas_url
    click_on "Edit", match: :first

    fill_in "Character", with: @koala.character
    fill_in "Colour", with: @koala.colour
    fill_in "Dob", with: @koala.dob
    fill_in "Favourite food", with: @koala.favourite_food
    fill_in "Name", with: @koala.name
    click_on "Update Koala"

    assert_text "Koala was successfully updated"
    click_on "Back"
  end

  test "destroying a Koala" do
    visit koalas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Koala was successfully destroyed"
  end
end
