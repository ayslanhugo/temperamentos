class CreateTestResults < ActiveRecord::Migration[8.0]
  def change
    create_table :test_results do |t|
      t.integer :sanguine, default: 0
      t.integer :choleric, default: 0
      t.integer :melancholic, default: 0
      t.integer :phlegmatic, default: 0

      t.timestamps
    end
  end
end
