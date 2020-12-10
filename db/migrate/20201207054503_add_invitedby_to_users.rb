class AddInvitedbyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :invited_by, polymorphic: true, null: true
  end
end
