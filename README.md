# Functional CoffeeScript

## a worksheet for Michael Fogus' Book

After reading Michael's book, I wanted to see what idioms and patterns
applied to my own CoffeeScript, how many ideas are directly applied
through the CoffeeScript compiler, and how that code might look if we
first did a direct translation of the code and then how it might look in
idiomatic CoffeeScript. Naively reading the first time, I realized that
some ideas might actually be less well represented in CoffeeScript and
more natural feeling in native JavaScript. I also thought the contrary
on several occasions. 

This is really just a hobby project but if you find it interesting you
are welcome to fork and contribute.

## Getting started

* clone the repo
* `cd` into the directory
* `npm install`
* `grunt test`

All specs run on phantomjs. Absolutely zero fanciness. 

## Chapter Notes

### Chapter 1

Almost everything at this point is a direct translation of the js
examples in the book. One interesting note is the use of the `existy`
function. This is basically available natively in CoffeeScript as `?`
and you will see that represented in my implementation of the method. It
is implemented, but the `?` operator in CS is used instead of the
`existy` method where applicable. 

I've taken the approach of creating static methods on constructor
objects(`class` keyword in CoffeeScript). I'm really just doing this to
create obvious namespaces, but it also presents the opportunity to
reference functions in the same namespaces with the 'this' notation `@`.
Not sure I will continue in this format, but it seemed an obvious way
to start.

Code for chapter 1 spans the enumerable, window, and fun classes in the
src directory. Specs for those functions are in the appropriate spec
file.

---

## Project Temaplate was taken from coffeescript-jasmine-boilerplate

And all attribution for the setup of the project and compliation tasks
should be passed on to that project. Original readme below...

coffeescript-jasmine-boilerplate is a small framework that was created with code katas in mind.  It gives you a quick way
to begin writing and testing CoffeeScript with Jasmine.

## Getting Started

First, you'll need [node.js](http://nodejs.org) and [PhantomJS](http://phantom.js) installed.

Next, clone the repo and create your project:

``` bash
$ git clone git@github.com:andrewvida/coffeescript-jasmine-boilerplate.git <your-project-name>
```

Then, install grunt and all of its dependencies from the root of your project:
``` bash
$ npm install
```

## About
coffeescript-jasmine-boilerplate includes several plugins that allow you to focus on your kata.  grunt-contrib-watch has been configured
to keep an eye on whenever CoffeeScript files change. grunt-contrib-coffee will automatically compile your CoffeeScript into JavaScript and grunt-contrib-jasmine
executes your jasmine specs.

Also included is [jasmine-given](https://github.com/searls/jasmine-given).  It is a jasmine helper that encourages leaner, meaner specs using `Given`, `When`, and `Then`.

## Usage

Once you're ready, kick it off by executing:

``` bash
$ grunt watch
```
--NOTE: grunt-contrib-watch is still work in progress, so if you add a new .coffee file and nothing happens, you can compile
manually and run the tests by using:

```bash
$ grunt coffee
```
then

```bash
$ grunt jasmine
```
