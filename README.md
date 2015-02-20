---
tags: cli, oo, full-application, project
language: ruby
resources: 1
---

# Project Week 1

## Guidelines

1. Groups
 * You may work alone or in pairs. The max group size is two.
2. Timeline
  * You will have three days of class to complete this project. 
  * Your app must have basic functionality by the early afternoon on Wednesday the 25th as you will be presenting it to the class around 4pm.
3. Approval
  * Before starting on your project, you must get your idea approved by an instructor.
4. Design
  * Your app using object oriented programming techniques
5. Two main components
  * Your app must fetch data from the internet by making API calls or scraping
  * Your app must be have an interactive command line interface or CLI

## Requirements

Your app should have at least three classes:

1. CLI Runner
  * One class should handle the CLI section and it should be located in the `app/runners` folder'
  * This should be interactive. Users should be able to change the way it behaves through typing keywords. Keywords that must be accounted for are:
    * help
    * exit
  * The CLI should also respond to at least two more keywords of your choosing (these will probably vary depending on the purpose of your app)
2. Data Fetcher
  * The second class should fetch data and it will be in the `app/data_fetchers` folder
  * This could be a [Nokogiri scraper](), in which case you should name it something like BuzzFeedScraper, `app/data_fetchers/buzzfeed_scraper.rb`
  * It could also make API calls, in which case you should name it something like BuzzFeedAPICaller, `app/data_fetchers/buzzfeed_api_caller.rb`
    * The API you select must not require authentication (that means no Twitter, no Facebook, no Instagram, etc.)
3. Model(s)
  * The third class should be a model of your data, in the `app/models` folder
  * If you are fetching data from Spotify for instance, an appropriate model might be Song. Song could have a couple attributes:
    * artist
    * album
    * length
    * etc.
  * Feel free to use more than one model for your data, one is the minimum

## Inspiration



## Instructions

* Choose your group or decide to work alone.
* Brainstorm ideas.
* Get your idea approved by an instructor.
* Decide who will fork this lab.
* Have everyone in your group clone down the fork onto their local machines.
* Get familiar with the structure of this lab:

```txt
├── README.md
├── app
│   ├── concerns
│   │   └── example_module.rb
│   ├── data_fetchers
│   │   ├── example_api_caller.rb
│   │   └── example_scraper.rb
│   ├── models
│   │   └── example_model.rb
│   └── runners
│       └── example_cli.rb
├── bin
│   └── cli
├── config
│   └── environment.rb
└── spec
    ├── example_spec.rb
    ├── fixtures
    │   └── example_fixture_file.json
    └── spec_helper.rb
```

* Think about what your model(s) will look like.
* Start replacing the example code with your own code *in this order*:
  * See what kind of data you can get from your API calls or your scraper and start to build it out
  * Given this data, make your model(s)
  * Have your data fetcher (either API caller or scraper) instantiate new instances of your model(s)
  * Once you have a functional API caller/scraper, start working on your CLI class in `app/runners/example_cli.rb`
  * Update `bin/cli.rb` so that it calls on your CLI class correctly. You should be able to run `ruby bin/cli.rb` from your terminal to interact with your app.
  * Once your CLI is functional, replace this readme with instructions on how to use your app.
  * If you have time, start testing your app (see the bonus section).

## Bonus

Test your app. Refer to tests for [Playlister CLI](https://github.com/flatiron-school-ironboard/playlister-cli-bk-002) if you'd like to see how to test CLIs. Refer to [RSpec Docs](https://www.relishapp.com/rspec) (they're actually great) if you have questions.

## Resources

* [RSpec Docs](https://www.relishapp.com/rspec)
* [Playlister CLI](https://github.com/flatiron-school-ironboard/playlister-cli-bk-002)
