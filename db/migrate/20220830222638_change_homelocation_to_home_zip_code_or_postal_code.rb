class ChangeHomelocationToHomeZipCodeOrPostalCode < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :homelocation, :home_location_code
  end
end
