class CreateProposals < ActiveRecord::Migration
  def self.up
    create_table :proposals do |t|
      t.string :title
      t.string :description
      t.decimal :amount_saved
    end
  end

  def self.down
    drop_table :proposals
  end
end
