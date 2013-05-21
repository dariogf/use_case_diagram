# UseCase

This gem can be used to generate use case diagrams in dot format by using a simpler syntaxis.

## Installation

gem install use_case 

Or you may add this line to your application's Gemfile:

    gem 'use_case'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install use_case

## Usage

Create a text file with the use_case description (ej1.txt):

actor :user
actor :admin

node :login
node :logout
node :other
node :askpassword "Ask password"

:user uses :login, :other

:admin uses :logout

:login includes :askpassword, :askname

:logout extended :extend1_logout, :extend2_logout
:askname includes :askfirstname
:askname extended :asksecondname

Then you can parse it to create the dot file:

use_case ej1.txt > ej1.dot

and call dot to create a pdf or png:

dot -Tpdf -o ej1.pdf ej1.dot

Obviously, you need dot installed to make this conversion.


You can also use it with pipes:

use_case ej1.txt | dot -Tpdf -o ej1.pdf ej1.dot


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
