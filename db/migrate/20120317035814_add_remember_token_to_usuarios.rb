class AddRememberTokenToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :remember_token, :string
    add_index  :usuarios, :remember_token
  end
end
