# Ruboty::Evaluate

Ruboty handler to evaluate a command.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-evaluate'
```

## Usage

```
@ruboty eval <command>
```

## Example

```
> @ruboty eval echo 'foo'
foo
> @ruboty eval ruby -e 'puts "bar"'
bar
```
