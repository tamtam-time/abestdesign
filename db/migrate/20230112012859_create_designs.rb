class CreateDesigns < ActiveRecord::Migration[6.0]
  def change
    create_table :designs do |t|
      t.string :title, null: false
      t.text :file_name, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end

end
