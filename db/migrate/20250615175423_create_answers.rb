class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.string :temperament_type
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
