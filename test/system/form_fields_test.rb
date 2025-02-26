require "application_system_test_case"

class FormFieldsTest < ApplicationSystemTestCase
  setup do
    @form_field = form_fields(:one)
  end

  test "visiting the index" do
    visit form_fields_url
    assert_selector "h1", text: "Form fields"
  end

  test "should create form field" do
    visit form_fields_url
    click_on "New form field"

    fill_in "Description", with: @form_field.description
    fill_in "Field type", with: @form_field.field_type
    fill_in "Form", with: @form_field.form_id
    fill_in "Label", with: @form_field.label
    click_on "Create Form field"

    assert_text "Form field was successfully created"
    click_on "Back"
  end

  test "should update Form field" do
    visit form_field_url(@form_field)
    click_on "Edit this form field", match: :first

    fill_in "Description", with: @form_field.description
    fill_in "Field type", with: @form_field.field_type
    fill_in "Form", with: @form_field.form_id
    fill_in "Label", with: @form_field.label
    click_on "Update Form field"

    assert_text "Form field was successfully updated"
    click_on "Back"
  end

  test "should destroy Form field" do
    visit form_field_url(@form_field)
    click_on "Destroy this form field", match: :first

    assert_text "Form field was successfully destroyed"
  end
end
