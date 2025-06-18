class TestResult < ApplicationRecord
  # Adicione todos os métodos abaixo:

  # Organiza as pontuações em um formato fácil de usar
  def scores_hash
    {
      "choleric"    => { name: "Colérico",    score: self.choleric },
      "sanguine"    => { name: "Sanguíneo",   score: self.sanguine },
      "melancholic" => { name: "Melancólico", score: self.melancholic },
      "phlegmatic"  => { name: "Fleumático",  score: self.phlegmatic }
    }
  end

  # Retorna a lista de temperamentos ordenada da maior para a menor pontuação
  def sorted_scores
    scores_hash.sort_by { |slug, data| -data[:score] }
  end

  # Retorna o temperamento com a maior pontuação
  def dominant_temperament
    sorted_scores.first # O primeiro da lista ordenada
  end

  # Retorna o segundo temperamento com a maior pontuação
  def secondary_temperament
    sorted_scores.second # O segundo da lista ordenada
  end

  # Calcula a soma de todos os pontos para usar na barra de progresso
  def total_score
    total = self.choleric + self.sanguine + self.melancholic + self.phlegmatic
    # Retorna 1 se o total for 0 para evitar um erro de divisão por zero
    total.zero? ? 1 : total
  end
end