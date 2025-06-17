class QuestionsController < ApplicationController
  # Mantemos os métodos do scaffold, eles ainda podem ser úteis para manutenção
  before_action :set_question, only: %i[ show edit update destroy ]

  # Esta é a nossa tela principal do quiz
  def index
    # Encontra a pergunta pelo ID passado na URL, ou pega a primeira se nenhum ID for passado.
    @question = Question.find_by(id: params[:question_id]) || Question.first

    if @question
      # Carrega as respostas associadas a essa pergunta
      @total_questions = Question.count
      @current_question_number = Question.where("id <= ?", @question.id).count
    else
      # Se não há mais perguntas, significa que o teste acabou.
      redirect_to results_path, notice: "Teste finalizado!"
    end
  end

  # Esta ação processa a resposta do usuário
  def submit_answer
  # Busca o resultado do teste pela sessão
  test_result = TestResult.find(session[:test_result_id])

  # Encontra a afirmação que foi respondida para saber seu temperamento
  question = Question.find(params[:question_id])

  # Pega a pontuação do botão clicado (1, 2, ou 3)
  score = params[:score].to_i

  # Usa um 'case' no temperamento da PRÓPRIA PERGUNTA
  # para saber qual contador incrementar com a nova pontuação
  case question.temperament_type
  when "sanguine"
    test_result.sanguine += score
  when "choleric"
    test_result.choleric += score
  when "melancholic"
    test_result.melancholic += score
  when "phlegmatic"
    test_result.phlegmatic += score
  end

  # Salva o resultado atualizado no banco de dados
  test_result.save!

  # A lógica para encontrar a próxima pergunta continua a mesma
  next_question = Question.where("id > ?", question.id).order(:id).first

  if next_question
    redirect_to questions_path(question_id: next_question.id)
  else
    redirect_to results_path
  end
  end

  def start_test
  test_result = TestResult.create!
  session[:test_result_id] = test_result.id

  respond_to do |format|
    format.html { redirect_to questions_path, notice: "O teste começou!" }
  end
end

  # Métodos do scaffold abaixo...
  def show; end
  def new; @question = Question.new; end
  def edit; end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: "Pergunta criada com sucesso."
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "Pergunta atualizada com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: "Pergunta destruída com sucesso."
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content)
  end
end
