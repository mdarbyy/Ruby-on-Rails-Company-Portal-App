class ChangeAnswerToAnswersForFormSubmissions < ActiveRecord::Migration[7.0]
  def change
    rename_column :form_submissions, :answer, :answers
  end
end
