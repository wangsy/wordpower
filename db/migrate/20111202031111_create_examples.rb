class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.text :example
      t.text :translated
      t.integer :meaning_id

      t.timestamps
    end
  end
end
