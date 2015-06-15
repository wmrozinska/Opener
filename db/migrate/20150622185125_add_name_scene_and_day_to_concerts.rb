class AddNameSceneAndDayToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :name, :string
    add_column :concerts, :scene, :string
    add_column :concerts, :day, :date
  end
end

