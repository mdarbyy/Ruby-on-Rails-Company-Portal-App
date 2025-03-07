require "application_system_test_case"

class FormSubmissionsTest < ApplicationSystemTestCase
  setup do
    @form_submission = form_submissions(:one)
  end

  test "visiting the index" do
    visit form_submissions_url
    assert_selector "h1", text: "Form submissions"
  end

  test "should create form submission" do
    visit form_submissions_url
    click_on "New form submission"

    fill_in "Answer", with: @form_submission.answer
    fill_in "Completed on", with: @form_submission.completed_on
    fill_in "Form", with: @form_submission.form_id
    fill_in "User", with: @form_submission.user_id
    click_on "Create Form submission"

    assert_text "Form submission was successfully created"
    click_on "Back"
  end

  test "should update Form submission" do
    visit form_submission_url(@form_submission)
    click_on "Edit this form submission", match: :first

    fill_in "Answer", with: @form_submission.answer
    fill_in "Completed on", with: @form_submission.completed_on
    fill_in "Form", with: @form_submission.form_id
    fill_in "User", with: @form_submission.user_id
    click_on "Update Form submission"

    assert_text "Form submission was successfully updated"
    click_on "Back"
  end

  test "should destroy Form submission" do
    visit form_submission_url(@form_submission)
    click_on "Destroy this form submission", match: :first

    assert_text "Form submission was successfully destroyed"
  end
end
