Chronik
=======

Chronik is a very small library used to translate dates' classes, as seen on
public transport timetables, like "Weekdays" or "Easter and Christmas", to
actual dates (or weekdays if it directly relates to them). It is inspired by
[mojombo/chronic](https://github.com/mojombo/chronic).

Instalation
-----------

    gem install chronik

Usage
-----

Most basic usage: translate day(s) of the week to integer (from 0 to 6)

    require 'chronik'
    label = Chronik::Label.new "Soboty" # Polish word for Saturday
    label.weekdays #=> [6]

Slightly more complicated: get the dates of given holidays. Since holidays are
repeted every once in a year and we don't want an infinite array, we need to
specify a date range.

    require 'chronik'
    require 'date'
    range = Date.new(2011,1,1)..Date.new(2011,12,31)
    label = Chronik::Label.new "Wielkanoc" # Polish word for Easter
    label.holidays(range) #=> [Date.new(2011,4,24), Date.new(2011,4,25)]

Limitations
-----------

Currently only Polish language is supported, but it is super easy to add
another language. Look for constants in
[lib/chronik/chronik.rb](http://github.com/stanley/chronik/tree/master/lib/chronik/chronik.rb)
file.

License
-------

Copyright (C) 2011 by Stanisław Wasiutyński

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
