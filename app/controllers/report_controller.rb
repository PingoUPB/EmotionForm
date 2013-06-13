require 'csv'

class ReportController < ApplicationController
  before_filter :authenticate_user!, :only_admin
	def to_csv
		@questions = Question.all

		csv_data = CSV.generate do |csv|

			csv << ['Benutzer', 'Zeit', 'Frage', 'Antwort']

			@questions.each do |question|
				question.answers.each do |answer|
					csv << [answer.user.id, answer.created_at, question.name, answer.text]
				end
			end

		end

		send_data csv_data, :type => 'text/csv', :filename => 'report_'+Time.current.to_s.tr(" ", "_")

	end
end
