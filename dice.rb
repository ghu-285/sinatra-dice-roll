require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  erb(:two_6)
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  erb(:two_10)
end

get("/dice/1/20") do
  die = rand(1..20)

  @outcome = "You rolled a #{die}."
  erb(:one_20)
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  die_3 = rand(1..4)
  die_4 = rand(1..4)
  die_5 = rand(1..4)
  sum = first_die + second_die + die_3 + die_4 + die_5

  @outcome = "You rolled a #{first_die} and a #{second_die} and a #{die_3} and a #{die_4} and a #{die_5} for a total of #{sum}."
  erb(:five_4)
end
