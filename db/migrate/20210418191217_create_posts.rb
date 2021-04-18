class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.date :date
      t.integer :time
      t.string :learning_plan
      t.text :learning_content
      t.text :it_took_time
      t.text :something_felt
      t.text :notices
      t.string :tomorrow

      t.timestamps
    end
  end
end
