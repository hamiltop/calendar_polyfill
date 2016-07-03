# CalendarPolyfill [![Build Status](https://travis-ci.org/hamiltop/calendar_polyfill.svg?branch=master)](https://travis-ci.org/hamiltop/calendar_polyfill)

Polyfill for new Calendar types in Elixir. If Calendar types already exist, this does nothing but define an
empty `CalendarPolyfill` module. Should work with 1.3 and 1.2.

## Use

Everything should work out of the box except sigils. To use sigils, `import CalendarPolyfill`.
