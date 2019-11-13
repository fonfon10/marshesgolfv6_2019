require "application_system_test_case"

class OpenClosesTest < ApplicationSystemTestCase
  setup do
    @open_close = open_closes(:one)
  end

  test "visiting the index" do
    visit open_closes_url
    assert_selector "h1", text: "Open Closes"
  end

  test "creating a Open close" do
    visit open_closes_url
    click_on "New Open Close"

    fill_in "Name", with: @open_close.name
    click_on "Create Open close"

    assert_text "Open close was successfully created"
    click_on "Back"
  end

  test "updating a Open close" do
    visit open_closes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @open_close.name
    click_on "Update Open close"

    assert_text "Open close was successfully updated"
    click_on "Back"
  end

  test "destroying a Open close" do
    visit open_closes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Open close was successfully destroyed"
  end
end
