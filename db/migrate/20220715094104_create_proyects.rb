class CreateProyects < ActiveRecord::Migration[7.0]
  def change
    create_table :proyects do |t|
      t.string :name
      t.string :description
      t.string :repo
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :active

      t.timestamps
    end
  end
end
