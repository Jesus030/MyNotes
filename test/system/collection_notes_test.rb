require "application_system_test_case"

class CollectionNotesTest < ApplicationSystemTestCase
  setup do
    @collection_note = collection_notes(:one)
  end

  test "visiting the index" do
    visit collection_notes_url
    assert_selector "h1", text: "Collection notes"
  end

  test "should create collection note" do
    visit collection_notes_url
    click_on "New collection note"

    click_on "Create Collection note"

    assert_text "Collection note was successfully created"
    click_on "Back"
  end

  test "should update Collection note" do
    visit collection_note_url(@collection_note)
    click_on "Edit this collection note", match: :first

    click_on "Update Collection note"

    assert_text "Collection note was successfully updated"
    click_on "Back"
  end

  test "should destroy Collection note" do
    visit collection_note_url(@collection_note)
    click_on "Destroy this collection note", match: :first

    assert_text "Collection note was successfully destroyed"
  end
end
