class AddApprovedToProposals < ActiveRecord::Migration
  def self.up
    change_table :proposals do |t|
      t.boolean :approved, :default => false
    end
    Proposal.update_all ["approved = ?", true]
  end

  def self.down
    remove_column :proposals, :approved
  end
end
