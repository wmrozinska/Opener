class AddPictureurlToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :pictureurl, :string
  end
end
