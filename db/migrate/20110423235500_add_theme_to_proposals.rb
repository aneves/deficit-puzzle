class AddThemeToProposals < ActiveRecord::Migration
  def self.up
    add_column :proposals, :theme_id, :integer
    theme = Theme.first || Theme.create!( :title => 'default' )
    Proposal.update_all ["theme_id = ?", theme.id]
    change_column :proposals, :theme_id, :integer, :null => false
  end

  def self.down
    remove_column :proposals, :theme_id
  end
end
