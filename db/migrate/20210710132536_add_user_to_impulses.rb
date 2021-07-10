class AddUserToImpulses < ActiveRecord::Migration[6.1]
  def change
    add_reference :impulses, :user, null: false, foreign_key: true
  end
end
