class ChangeDescToBeTextInImpulses < ActiveRecord::Migration[6.1]
  def up
    change_column :impulses, :desc, :text
  end

  def down
    change_column :impulses, :desc, :string
  end
end
