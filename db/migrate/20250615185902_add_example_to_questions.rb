class AddExampleToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :example, :text
  end
end
