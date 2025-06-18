class PagesController < ApplicationController
  def home
  end

# Em app/controllers/pages_controller.rb

def results
  result = TestResult.find_by(id: session[:test_result_id])
  
  if result
    scores = {
      "choleric"    => { name: "Colérico",    score: result.choleric },
      "sanguine"    => { name: "Sanguíneo",   score: result.sanguine },
      "melancholic" => { name: "Melancólico", score: result.melancholic },
      "phlegmatic"  => { name: "Fleumático",  score: result.phlegmatic }
    }
    
    @total_score = scores.values.sum { |data| data[:score] }
    @total_score = 1 if @total_score == 0
    
    # Ordena os resultados do maior para o menor
    sorted_scores = scores.sort_by { |slug, data| -data[:score] }

    # Pega o primeiro e o segundo colocados
    @dominant = sorted_scores[0]
    @secondary = sorted_scores[1]

    @all_scores = sorted_scores # Passa a lista já ordenada para a view
  else
    redirect_to root_path, alert: "Você precisa fazer o teste primeiro!"
  end
end
  def reset_test
    # Apaga a chave da sessão que guarda o resultado do teste
    session[:test_result_id] = nil
    
    # Redireciona o usuário para a página inicial com um aviso
    redirect_to root_path, notice: "Tudo pronto para um novo teste!"
  end
end
