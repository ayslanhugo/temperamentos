class QuestionsController < ApplicationController
  # Esta é a nossa tela principal do quiz
  def index
    # Trava de segurança: Se a sessão não foi iniciada, reinicia o teste.
    redirect_to start_test_path and return unless session[:question_order]

    question_index = session[:current_question_index].to_i
    
    if question_index < session[:question_order].length
      question_id = session[:question_order][question_index]
      @question = Question.find(question_id)
      
      # Lógica da barra de progresso
      @total_questions = session[:question_order].length
      @current_question_number = question_index + 1
    else
      # Se o teste terminou, vai para os resultados.
      redirect_to results_path
    end
  end

  # Cria um novo teste, com uma nova ordem de perguntas
  def start_test
    test_result = TestResult.create!
    session[:test_result_id] = test_result.id
    
    session[:question_order] = Question.pluck(:id).shuffle
    session[:current_question_index] = 0
    session[:question_history] = []
    
    respond_to do |format|
      format.html { redirect_to questions_path, notice: "O teste começou!" }
    end
  end

  # Processa a resposta e avança para o próximo índice
  def submit_answer
  puts "============================================="
  puts "--- AÇÃO: submit_answer ---"
  puts "Índice ATUAL na sessão: #{session[:current_question_index].inspect}"
  puts "Tamanho do Histórico ATUAL: #{session[:question_history].try(:length)}"
  puts "============================================="

  redirect_to start_test_path and return unless session[:test_result_id]

  test_result = TestResult.find(session[:test_result_id])
  answered_question = Question.find(params[:question_id])
  score_to_add = params[:score].to_i

  # ... (código que aplica a pontuação) ...
  case answered_question.temperament_type
  when "sanguine"
    test_result.sanguine += score_to_add
  when "choleric"
    test_result.choleric += score_to_add
  when "melancholic"
    test_result.melancholic += score_to_add
  when "phlegmatic"
    test_result.phlegmatic += score_to_add
  end
  test_result.save!

  session[:question_history] << {
    temperament: answered_question.temperament_type,
    score: score_to_add,
    index: session[:current_question_index] 
  }

  session[:current_question_index] += 1

  redirect_to questions_path
end


  # Volta para o índice anterior
def go_back
  # Pega a última ação do histórico e a remove da lista
  last_action = session[:question_history].pop

  if last_action
    # Reverte a pontuação da última ação
    test_result = TestResult.find(session[:test_result_id])
    
    # --- CORREÇÃO AQUI ---
    score_to_remove = last_action[:score].to_i
    temperament_to_revert = last_action[:temperament]

    case temperament_to_revert
    when "sanguine"
      test_result.sanguine -= score_to_remove
    when "choleric"
      test_result.choleric -= score_to_remove
    when "melancholic"
      test_result.melancholic -= score_to_remove
    when "phlegmatic"
      test_result.phlegmatic -= score_to_remove
    end
    test_result.save!

    # --- CORREÇÃO PRINCIPAL AQUI ---
    # Restaura o índice para o da pergunta anterior, usando a chave como Símbolo
    session[:current_question_index] = last_action[:index]
    
    # Removemos os 'puts' de depuração
    redirect_to questions_path
  else
    # Se não há histórico para voltar, apenas vai para a primeira pergunta
    redirect_to questions_path
  end
end
end