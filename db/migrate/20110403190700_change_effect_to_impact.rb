class ChangeEffectToImpact < ActiveRecord::Migration
  def self.up
    rename_column :proposals, :effect, :impact
  end

  def self.down
    rename_column :proposals, :impact, :effect
  end
end
