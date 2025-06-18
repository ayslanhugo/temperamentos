class QuestionsController < ApplicationController
  # Esta é a nossa tela principal do quiz
  def index
    # Se a ordem de perguntas não existir na sessão, significa que o teste não foi iniciado.
    # Redirecionamos para a ação que inicia o teste.
    redirect_to start_test_path and return unless session[:question_order]

    question_index = session[:current_question_index].to_i
    
    # Verifica se o teste ainda não terminou
    if question_index < session[:question_order].length
      question_id = session[:question_order][question_index]
      @question = Question.find(question_id)
      
      # A lógica da barra de progresso agora usa o índice da sessão
      @total_questions = session[:question_order].length
      @current_question_number = question_index + 1
    else
      # Se o índice ultrapassou o número de perguntas, o teste acabou.
      redirect_to results_path, notice: "Teste finalizado!"
    end
  end

  # Cria um novo teste, com uma nova ordem de perguntas
  def start_test
    test_result = TestResult.create!
    session[:test_result_id] = test_result.id
    
    # AQUI ESTÁ A MÁGICA:
    # 1. Pega o ID de todas as perguntas.
    # 2. Embaralha (.shuffle) a ordem desses IDs.
    # 3. Guarda essa ordem aleatória na sessão.
    session[:question_order] = Question.pluck(:id).shuffle
    session[:current_question_index] = 0 # Começa no primeiro item da lista (índice 0)
    session[:question_history] = []
    
    respond_to do |format|
      format.html { redirect_to questions_path, notice: "O teste começou!" }
    end
  end

  # Processa a resposta e avança para o próximo índice
  def submit_answer
    test_result = TestResult.find(session[:test_result_id])
    answered_question = Question.find(params[:question_id])
    score_to_add = params[:score].to_i

    # Salva a pontuação
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

    # Salva a ação no histórico
    session[:question_history] << {
      question_id: answered_question.id,
      temperament: answered_question.temperament_type,
      score: score_to_add,
      # Guardamos o índice para o botão de voltar saber para onde ir
      index: session[:current_question_index] 
    }

    # AVANÇA PARA A PRÓXIMA PERGUNTA
    session[:current_question_index] += 1
    
    # Redireciona para a ação index, que mostrará a pergunta do novo índice
    redirect_to questions_path
  end

  # Volta para o índice anterior
  def go_back
    last_action = session[:question_history].pop
  
    if last_action
      # Reverte a pontuação
      test_result = TestResult.find(session[:test_result_id])
      score_to_remove = last_action["score"]
  
      case last_action["temperament"]
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
  
      # VOLTA PARA O ÍNDICE ANTERIOR
      session[:current_question_index] = last_action["index"]
      
      redirect_to questions_path
    else
      redirect_to questions_path
    end
  end
end