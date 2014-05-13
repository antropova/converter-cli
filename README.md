---
tags: cli, oo, playlister, parser
language: ruby
  resources: 1
---

# Playlister CLI

In `playlister-rb`, you built a simple domain model for Aritsts, Songs, and Genres. It is now time to make use of that domain model to build an interactive Command Line Jukebox that is populated with data from a folder filled with MP3s.

## Setting Up the Project

First, Fork and Clone this project. Code your answer in an appropriate branch, `solution`, and then submit a Pull Request.

You can run the test suite via `rspec`.

## Objectives

### Setup

The first step of this project is to set it up correctly.

You should be delivering the project with the folder structure and setup we've been learning about and using. It looks something like this:

```
bin/
config/
db/
lib/
 models/ 
spec/
```

#### `bin`

The `bin` directory contains your executables. Within this directory there is a file, `cli`, that will work as our runner, or the part of a program that kicks off the rest of the process. This file will do the following things:

1. The first line in the `cli`, that starts with a `#!` is a line that tells BASH what interpreter to run this script through. We send it to: `#!/usr/bin/env ruby`, our ruby interpreter. This lets us write a shell script that can be executed outside of the ruby command (`./bin/cli vs ruby ./bin/cli.rb`).
2. It requires our environment, see below.
3. We're going to keep this file super simple, it's only job is to create an instance of our PlaylisterCLI interface and then trigger it via the `call` method. We purposely keep this file super simple so that all of our knowledge about the Playlister CLI interface gets encapsulated within our PlaylisterCLI class, defined in lib/models/playlister_cli.rb

#### `config/environment`

This file should require all the files in our application so that our CLI and our test suite have a single require point.

#### `db/data`

This directory contains 99 fake MP3s from which you will build your music library using a LibraryParser class.

#### `lib/models`

Our models live in here, we'll be defining an `Artist`, `Song`, `Genre`, `LibraryParser`, and `PlaylisterCLI`. It might be helpful to create all the skeletons of these classes in these files immediately.

A skeleton of `Artist` in `artist.rb`.

```ruby
class Artist
end
```

#### `spec`

Our tests.

### Domain Model

I would approach building out the domain model in the following order.

#### `Song`, `Artist`, `Genre`

These classes have to be built in unison as they collaborate so heavily. Begin with the `Song` class according to spec as it is the central character, and add `Artist` and `Genre` behavior as they are required. They are very similar to the classes defined in the `playlister-rb` project.

Some new additions of functionality are class methods `find_by_name`, `create_by_name`, and `reset_all`. The `create_by_name` method is a shortcut to instantiation with a name. We do this because we want to extend the functionality of creating an instance, instead of changing the behavior of initialize. By building a class method `create_by_name` that explicitly accepts a name argument and handles initialization, the `initialize` method does not need to be responsible for attribute assignment. `find_by_name` should be able to pluck the correct object out of the collections within the class method `all`. Additionally, a `reset_all` method is provided to clear our data.

### `LibraryParser`

The `LibraryParser` should accept a relative path from the top of the directory that points to a directory with MP3s to parse. For example, `LibraryParser.new('db/data')` would point to the `data` directory provided within `db`.

The `library_parser_spec` defines a pretty specific vision for the library parser. It breaks it down to some small methods.

`files`

This method should return all the filenames within the target directory.

`parse`

Should actually parse all the file names and create corresponding instances.

`parse_filename`

Given a filename, this should separate it out to the corresponding data points of an artist, a song, and a genre.

`build_song`

Given an artist name, a song name, and a genre name, this method will build the corresponding object instances of `Artist`, `Song`, and `Genre`.

#### `PlaylisterCLI`

This class should be the primary interface for the command line application. Upon initialization, the PlaylisterCLI should parse the main data in data/db. It should allow the user to browse the music and play music. A basic version is included in the `playlister-cli` branch. Have fun with this, add functionality to perhaps browse by Genre or Artist.

## Resources
* [Build Awesome Command-Line Applications in Ruby](http://books.flatironschool.com/books/103) - [Chapter 1: Have a Clear and Concise Purpose](http://books.flatironschool.com/books/103), page 18
