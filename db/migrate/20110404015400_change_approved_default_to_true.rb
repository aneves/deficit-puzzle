class ChangeApprovedDefaultToTrue < ActiveRecord::Migration
  def self.up
    change_column :proposals, :approved, :boolean, :default => true
  end

  def self.down
    change_column :proposals, :approved, :boolean, :default => false
  end
end
