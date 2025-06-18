class PagesController < ApplicationController
  def home
    # Esta ação está correta, apenas renderiza a página inicial.
  end

  def results
    @test_result = TestResult.find_by(id: session[:test_result_id])

    # Redireciona se o teste não foi feito, para evitar erro na view.
    # A lógica de cálculo agora está no modelo TestResult.
    redirect_to root_path, alert: "Você precisa fazer o teste primeiro!" unless @test_result
  end

  def reset_test
    session[:test_result_id] = nil
    redirect_to root_path, notice: "Tudo pronto para um novo teste!"
  end
end