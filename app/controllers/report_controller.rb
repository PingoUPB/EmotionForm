require 'csv'

class ReportController < ApplicationController
	def to_csv
		@questions = Question.all

		csv_data = CSV.generate do |csv|

			@questions.each do |question|
				question.answers.each do |answer|
					csv << [answer.user, answer.created_at, question.name, answer.text]
				end
			end

		end

		send_data csv_data, :type => 'text/csv', :filename => 'report_'+Time.current.to_s.tr(" ", "_")

	end
end
