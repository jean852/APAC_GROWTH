class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :domain, null: false
      t.string :decription
      t.integer :founded
      t.integer :company_size
      t.string :country, null: false
      t.string :specialities, array: true, default: []
      t.string :tagline
      t.string :profile_pic_url
      t.string :background_cover_image_url

      t.timestamps
    end
  end
end
