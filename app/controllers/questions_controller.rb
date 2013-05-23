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
end
