class Answer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, type: String
  embedded_in :question
  belongs_to :user
  validates :user, presence: true
  validates :text, presence: true
end
