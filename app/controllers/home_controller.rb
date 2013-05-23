class HomeController < ApplicationController
  def index
    @questions = Question.all.asc :name
  end
end
