require "application_system_test_case"

class ImportantDatesTest < ApplicationSystemTestCase
  setup do
    @important_date = important_dates(:one)
  end

  test "visiting the index" do
    visit important_dates_url
    assert_selector "h1", text: "Important dates"
  end

  test "should create important date" do
    visit important_dates_url
    click_on "New important date"

    fill_in "Date", with: @important_date.date
    fill_in "Description", with: @important_date.description
    fill_in "Name", with: @important_date.name
    click_on "Create Important date"

    assert_text "Important date was successfully created"
    click_on "Back"
  end

  test "should update Important date" do
    visit important_date_url(@important_date)
    click_on "Edit this important date", match: :first

    fill_in "Date", with: @important_date.date
    fill_in "Description", with: @important_date.description
    fill_in "Name", with: @important_date.name
    click_on "Update Important date"

    assert_text "Important date was successfully updated"
    click_on "Back"
  end

  test "should destroy Important date" do
    visit important_date_url(@important_date)
    click_on "Destroy this important date", match: :first

    assert_text "Important date was successfully destroyed"
  end
end
