class AddImageToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :Image, :string
  end
end
