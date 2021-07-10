class CreateImpulses < ActiveRecord::Migration[6.1]
  def change
    create_table :impulses do |t|
      t.string :title
      t.integer :level
      t.string :desc

      t.timestamps
    end
  end
end
