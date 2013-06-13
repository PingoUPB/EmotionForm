class QuestionsController < ApplicationController
  def answer
    params[:answers].each do |key, value|
      Question.find(key).save_answer(value, current_user)
    end
    redirect_to root_path, notice: "Dankeschön!"
  end

  def show
    @question = Question.find params[:id]
  end

  def new
  	@question = Question.new
  end

  def create
  	@question = Question.new params[:question]

    set_options @question, params[:options]

  	if @question.save
  		redirect_to @question, notice: "Die Frage wurde erstellt."
  	else
  		render action: :new
  	end
  end

  def edit
		@question = Question.find params[:id]
  end

  def update
  	@question = Question.find params[:id]
    set_options @question, params[:options]

    if @question.update_attributes params[:question]
      redirect_to @question, notice: "Die Frage wurde gespeichert."
    else
      render action: :edit
    end
  end

  def index
    if current_user.admin
      @questions = Question.all 
    else
      redirect_to root_path
    end
  end

  def destroy
    @question = Question.find params[:id]
    @question.destroy
    redirect_to questions_path, notice: "Die Frage wurde geloescht."
  end

  protected
  def set_options(question, options)
    options_arr = options.split(',').map do |option|
      option.strip unless option.strip.blank?
    end
    question.options = options_arr.compact
  end
end
