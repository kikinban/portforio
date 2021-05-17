class ChangePostsToStudyRecords < ActiveRecord::Migration[6.1]
  def change
    rename_table :posts, :study_records
  end
end
