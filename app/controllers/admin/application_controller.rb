class Admin::ApplicationController < ApplicationController
  # Esta linha mágica ativa a autenticação para todos os controllers
  # que herdarem desta classe.
  http_basic_authenticate_with name: Rails.application.credentials.admin[:username],
                               password: Rails.application.credentials.admin[:password]
end