# DateAndTimeInput

DateAndTimeInput is a Rails extension, providing a form input for DateTime attributes
arranged as two input fields, for date and time, respectively.

## Installation

    $ gem install date_and_time_input

## Usage

To use DateAndTimeInput in your view templates,
you need to specify the input presentation as follows:

    date_and_time_field :letter, :sent_at

or, as a `form_for` field:

    f.date_and_time :sent_at

and that's it.

## Authors

- [Slava Kravchenko](https://github.com/cordawyn)
