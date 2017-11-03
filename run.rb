#!/usr/env/ruby

require_relative 'keypad'
require_relative 'dialer'


PHONENUMBER_LENGTH = 2
KEYPAD_BROKEN_DIGITS = (1..9).to_a.shuffle[0..1]

keys   = Keypad.new(KEYPAD_BROKEN_DIGITS)
dialer = Dialer.new(keys, PHONENUMBER_LENGTH)


puts "\nThe following are valid combinations for of #{PHONENUMBER_LENGTH} digits on a Knight's Keypad with broken keys #{KEYPAD_BROKEN_DIGITS} :\n"

puts dialer.dial

