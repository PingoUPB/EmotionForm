class Question
  include Mongoid::Document
  
  field :name, type: String
  
  embeds_many :answers
  
  def save_answer(answer, current_user)
    self.answers.create text: answer, user: current_user
  end
end
