class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.string :description
      t.integer :order_number
      t.integer :survey_id
      t.integer :question_type_id

      t.timestamps null: false
    end
  end
end
