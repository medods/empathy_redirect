class CreateRedirects < ActiveRecord::Migration[6.1]
  def change
    create_table :redirects do |t|
      t.string :domain
      t.string :url
      t.string :path

      t.timestamps
    end
  end
end
