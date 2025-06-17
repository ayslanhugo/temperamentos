class AddTemperamentTypeToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :temperament_type, :string
  end
end
