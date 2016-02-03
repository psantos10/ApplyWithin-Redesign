class AddColumnsAvailabilitiesTable < ActiveRecord::Migration

  def change
    create_table :availabilities do |t|
      t.references :hunter, index: true

      t.boolean :mon_m
      t.boolean :mon_a
      t.boolean :mon_e
      t.boolean :mon_l

      t.boolean :tue_m
      t.boolean :tue_a
      t.boolean :tue_e
      t.boolean :tue_l

      t.boolean :wed_m
      t.boolean :wed_a
      t.boolean :wed_e
      t.boolean :wed_l

      t.boolean :thur_m
      t.boolean :thur_a
      t.boolean :thur_e
      t.boolean :thur_l

      t.boolean :fri_m
      t.boolean :fri_a
      t.boolean :fri_e
      t.boolean :fri_l

      t.boolean :sat_m
      t.boolean :sat_a
      t.boolean :sat_e
      t.boolean :sat_l

      t.boolean :sun_m
      t.boolean :sun_a
      t.boolean :sun_e
      t.boolean :sun_l

      t.timestamps null: false
    end
  end
  
  def down
    drop_table :availabilities
  end
  
end    
    
