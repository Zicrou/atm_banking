require "application_system_test_case"

class AtmsTest < ApplicationSystemTestCase
  setup do
    @atm = atms(:one)
  end

  test "visiting the index" do
    visit atms_url
    assert_selector "h1", text: "Atms"
  end

  test "should create atm" do
    visit atms_url
    click_on "New atm"

    click_on "Create Atm"

    assert_text "Atm was successfully created"
    click_on "Back"
  end

  test "should update Atm" do
    visit atm_url(@atm)
    click_on "Edit this atm", match: :first

    click_on "Update Atm"

    assert_text "Atm was successfully updated"
    click_on "Back"
  end

  test "should destroy Atm" do
    visit atm_url(@atm)
    click_on "Destroy this atm", match: :first

    assert_text "Atm was successfully destroyed"
  end
end
