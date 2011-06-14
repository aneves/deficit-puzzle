class ChangeApprovedDefaultToTrueInThemes < ActiveRecord::Migration
  def self.up
    change_column :themes, :approved, :boolean, :default => true
  end

  def self.down
    change_column :themes, :approved, :boolean, :default => false
  end
end
