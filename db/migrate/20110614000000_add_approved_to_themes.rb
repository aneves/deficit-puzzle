class AddApprovedToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.boolean :approved, :default => false
    end
    Theme.update_all ["approved = ?", true]
  end

  def self.down
    remove_column :themes, :approved
  end
end
