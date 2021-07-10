require "application_system_test_case"

class ImpulsesTest < ApplicationSystemTestCase
  setup do
    @impulse = impulses(:one)
  end

  test "visiting the index" do
    visit impulses_url
    assert_selector "h1", text: "Impulses"
  end

  test "creating a Impulse" do
    visit impulses_url
    click_on "New Impulse"

    fill_in "Desc", with: @impulse.desc
    fill_in "Level", with: @impulse.level
    fill_in "Title", with: @impulse.title
    click_on "Create Impulse"

    assert_text "Impulse was successfully created"
    click_on "Back"
  end

  test "updating a Impulse" do
    visit impulses_url
    click_on "Edit", match: :first

    fill_in "Desc", with: @impulse.desc
    fill_in "Level", with: @impulse.level
    fill_in "Title", with: @impulse.title
    click_on "Update Impulse"

    assert_text "Impulse was successfully updated"
    click_on "Back"
  end

  test "destroying a Impulse" do
    visit impulses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Impulse was successfully destroyed"
  end
end
