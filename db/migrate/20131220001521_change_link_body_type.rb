class ChangeLinkBodyType < ActiveRecord::Migration
  def change
    change_column :links, :body, :text, null: true
  end
end
