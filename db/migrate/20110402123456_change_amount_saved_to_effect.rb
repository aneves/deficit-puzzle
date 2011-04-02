class ChangeAmountSavedToEffect < ActiveRecord::Migration
  def self.up
    rename_column :proposals, :amount_saved, :effect
  end

  def self.down
    rename_column :proposals, :effect, :amount_saved
  end
end
