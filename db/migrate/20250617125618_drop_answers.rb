class DropAnswers < ActiveRecord::Migration[8.0]
  def change
    drop_table :answers
  end
end
