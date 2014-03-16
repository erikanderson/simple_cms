class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.integer "subject_id"
      t.string "name"
      t.integer "permalink"
      t.integer "position"
      t.boolean "visible"
      t.timestamps
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end

  def down
    drop_table :pages
  end

end
