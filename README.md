# ATTENTION

Your bot will be queried with the following method:

* Bot#ask_for_bet(high_bet, pot, players)

and it's expected to return nil if it doesn't want to play anymore, or an integer representing the amount of money it wants to bet. If it bets more than it has, or more than it can during a round, the server will accept the maximum it can.

The args are:

* high_bet: the highest amount of money that has been bet
* pot: the amount of money in the pot right now
* players: an array containing players objects for each player still in the game. The player object supports two methods: Player#card and Players#stack, respectively returning the card they have and the money they have left

# Rsc::Arena

The Arena for bots matches.

## Installation

Add this line to your application's Gemfile:

    gem 'rsc-arena'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rsc-arena

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
