class QuestionsController < ApplicationController
  def answer
    params[:answers].each do |key, value|
      Question.find(key).save_answer(value, current_user)
    end
    redirect_to root_path, notice: "Thank you!"
  end

  def show
    @question = Question.find params[:id]
  end

  def new
  	@question = Question.new
  end

  def create
  	@question = Question.new params[:question]
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
  end
end
