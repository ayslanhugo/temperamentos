# app/models/admin.rb

module Admin
  def self.table_name_prefix
    "" # Retorna uma string vazia em vez de 'admin_'
  end
end