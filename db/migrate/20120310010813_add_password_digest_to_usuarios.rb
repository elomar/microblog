class AddPasswordDigestToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :password_digest, :string

  end
end
