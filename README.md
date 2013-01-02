# DateAndTimeInput

DateAndTimeInput is a Formtastic extension, providing a form input for DateTime attributes
arranged as two input fields, for date and time, respectively.

## Installation

    $ gem install date_and_time_input

## Usage

To use DateAndTimeInput in your view templates using Formtastic's `semantic_form_for`,
you need to specify the input presentation as follows:

    f.input :sent_at, as: :date_and_time_input

and that's it.

## Authors

- [Slava Kravchenko](https://github.com/cordawyn)
