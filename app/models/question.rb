class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :type, type: String, default: 'text'

  field :options, type: Array

  embeds_many :answers
  validates :name, presence: true
  validates :type, inclusion: ['text', 'scale'], presence: true

  def save_answer(answer, current_user)
    self.answers.create text: answer, user: current_user
  end
end
