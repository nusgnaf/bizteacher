class AddScoreToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :score, :integer
  end
end
