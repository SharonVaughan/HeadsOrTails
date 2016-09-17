#!/usr/bin/env ruby
require 'pry'
require 'csv'


# Gets the guesses from a file and stores in an array
class GameReader

	def coin_flips 
  		@coin_csv = CSV.read('game1.csv')
	end
end


# A coin is tossed with random results generated
class CoinToss
	
	def result
		rand(1..2) % 2 == 0 ? random_coin = "heads" : "tails"
	end
end


# Tabulates the results from GameReader and CoinToss
class GameReport
	@@toss_counter = 1

	def heading
		puts "Game #  |    Guess    | Result"
	end

	def print(game_reader, coin_toss)
		while @@toss_counter <= 5 do
			puts "  #{@@toss_counter}     |  #{game_reader.coin_flips[@@toss_counter-1]}  |  #{coin_toss.result}"
			@@toss_counter += 1
		end
	end
end

game_reader = GameReader.new
coin_toss = CoinToss.new
game_report = GameReport.new
game_report.heading
game_report.print(game_reader, coin_toss)


