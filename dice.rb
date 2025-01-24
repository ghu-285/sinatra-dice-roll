require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  '<a href="/dice/2/6"><h2>Roll two 6-sided die</h2></a>
  <a href="/dice/2/10"><h2>Roll two 10-sided die</h2></a>
  <a href="/dice/1/20"><h2>Roll one 20-sided die</h2></a>
  <a href="/dice/5/4"><h2>Roll five 4-sided die</h2></a>'
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end

get("/dice/1/20") do
  die = rand(1..20)

  outcome = "You rolled a #{die}."

  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  die_3 = rand(1..4)
  die_4 = rand(1..4)
  die_5 = rand(1..4)
  sum = first_die + second_die + die_3 + die_4 + die_5

  outcome = "You rolled a #{first_die} and a #{second_die} and a #{die_3} and a #{die_4} and a #{die_5} for a total of #{sum}."

  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end
