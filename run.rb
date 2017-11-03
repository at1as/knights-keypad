#!/usr/env/ruby

require_relative 'keypad'
require_relative 'dialer'


PHONENUMBER_LENGTH = 4
KEYPAD_BROKEN_DIGITS = [1, 5]

keys   = Keypad.new(KEYPAD_BROKEN_DIGITS)
dialer = Dialer.new(keys, PHONENUMBER_LENGTH)


puts dialer.dial

