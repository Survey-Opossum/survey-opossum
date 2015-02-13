class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.text :description
      t.integer :order_number
      t.integer :survey_id
      t.integer :question_type_id
      t.boolean :required

      t.timestamps null: false
    end
  end
end
