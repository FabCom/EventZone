require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Administrator", with: @event.administrator_id
    fill_in "Description", with: @event.description
    fill_in "Duration", with: @event.duration
    fill_in "Location", with: @event.location
    fill_in "Price", with: @event.price
    fill_in "Start date", with: @event.start_date
    fill_in "Title", with: @event.title
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Administrator", with: @event.administrator_id
    fill_in "Description", with: @event.description
    fill_in "Duration", with: @event.duration
    fill_in "Location", with: @event.location
    fill_in "Price", with: @event.price
    fill_in "Start date", with: @event.start_date
    fill_in "Title", with: @event.title
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
