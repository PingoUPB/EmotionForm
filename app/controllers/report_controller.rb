require 'csv'

class ReportController < ApplicationController
  before_filter :authenticate_user!, :only_admin
	def to_csv
		@questions = Question.all

		csv_data = CSV.generate do |csv|

			csv << ['Fragen-ID', 'Timestamp ID', 'Benutzer', 'Zeit', 'Frage', 'Antwort']

			@questions.each do |question|
				question.answers.each do |answer|
					timestamp_id = Digest::SHA1.hexdigest(answer.created_at.to_s + answer.user.id.to_s)

					csv << [question.id, timestamp_id, answer.user.id, answer.created_at, question.name, answer.text]
				end
			end

		end

		send_data csv_data, :type => 'text/csv', :filename => 'report_'+Time.current.to_s.tr(" ", "_")

	end
end
