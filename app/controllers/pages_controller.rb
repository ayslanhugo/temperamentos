class PagesController < ApplicationController
  def home
  end
  def results
  result = TestResult.find_by(id: session[:test_result_id])

  if result
    scores = {
      "choleric"    => { name: "Colérico",    score: result.choleric },
      "sanguine"    => { name: "Sanguíneo",   score: result.sanguine },
      "melancholic" => { name: "Melancólico", score: result.melancholic },
      "phlegmatic"  => { name: "Fleumático",  score: result.phlegmatic }
    }

    # Encontra o temperamento com a maior pontuação
    @dominant_slug, dominant_data = scores.max_by { |slug, data| data[:score] }
    @dominant_temperament_name = dominant_data[:name]

    # Guarda todos os resultados para exibir a lista completa, ordenados
    @all_scores = scores.sort_by { |slug, data| -data[:score] } # Ordena do maior para o menor
  else
    redirect_to root_path, alert: "Você precisa fazer o teste primeiro!"
  end
end
def reset_test
  # Apaga a chave da sessão que guarda o resultado do teste
  session[:test_result_id] = nil

  # Redireciona o usuário para a página inicial para começar de novo
  redirect_to root_path, notice: "Tudo pronto para um novo teste!"
end
end
