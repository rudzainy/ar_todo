require_relative '../../config/application'

class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.boolean :status
      t.string :item
    end
  end
end