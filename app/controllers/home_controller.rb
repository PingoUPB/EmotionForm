class HomeController < ApplicationController
  def index
    @questions = Question.all.desc :name
  end
end
