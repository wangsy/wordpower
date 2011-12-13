class CreateMeanings < ActiveRecord::Migration
  def change
    create_table :meanings do |t|
      t.integer :word_id
      t.text :meaning

      t.timestamps
    end
  end
end
