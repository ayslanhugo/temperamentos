class AddNameToTestResults < ActiveRecord::Migration[8.0]
  def change
    add_column :test_results, :name, :string
  end
end
