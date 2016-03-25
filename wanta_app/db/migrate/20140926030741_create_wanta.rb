class CreateWanta < ActiveRecord::Migration
  def change
    create_table :wanta do |t|
      t.string :uniqe
      t.text :content

      t.timestamps
    end
  end
end
