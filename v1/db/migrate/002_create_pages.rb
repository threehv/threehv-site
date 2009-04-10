class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.column :title, :string, :null => false
      t.column :seo_title, :string, :null => false
      t.column :contents, :text

      t.column :created_on, :datetime
      t.column :updated_on, :datetime
      t.column :lock_version, :integer, :default => 0
    end
    
    add_index :pages, :title
    add_index :pages, :seo_title
  end

  def self.down
    drop_table :pages
  end
end
