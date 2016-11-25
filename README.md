# Flood risk acceptance tests

[![Build Status](https://travis-ci.org/EnvironmentAgency/flood-risk-acceptance-tests.svg?branch=master)](https://travis-ci.org/EnvironmentAgency/flood-risk-acceptance-tests)
[![security](https://hakiri.io/github/EnvironmentAgency/flood-risk-acceptance-tests/master.svg)](https://hakiri.io/github/EnvironmentAgency/flood-risk-acceptance-tests/master)
[![Code Climate](https://codeclimate.com/github/EnvironmentAgency/flood-risk-acceptance-tests/badges/gpa.svg)](https://codeclimate.com/github/EnvironmentAgency/flood-risk-acceptance-tests)
[![Dependency Status](https://dependencyci.com/github/EnvironmentAgency/flood-risk-acceptance-tests/badge)](https://dependencyci.com/github/EnvironmentAgency/flood-risk-acceptance-tests)

You may need an environmental permit if you want to work in, over, under or near a main river or flood or sea defence. Some flood risk activities are exempt from needing a permit and you can carry out the work if you [register an exemption](https://www.gov.uk/guidance/register-your-flood-risk-exemption-environmental-permits).

[Register a flood risk activity exemption](https://register-flood-risk-exemption.service.gov.uk/) is the digital service which allows users to register an exemption.

This project contains the acceptance tests for the service. It is built around [Quke](https://github.com/EnvironmentAgency/quke), a Ruby gem that simplifies the process of writing and running Cucumber acceptance tests.

## Pre-requisites

This project is setup to run against version 2.3.1 of Ruby.

The rest of the pre-requisites are the same as those for [Quke](https://github.com/EnvironmentAgency/quke#pre-requisites).

## Installation

First clone the repository and then drop into your new local repo

```bash
git clone https://github.com/EnvironmentAgency/flood-risk-acceptance-tests.git && cd flood-risk-acceptance-tests
```

Next download and install the dependencies

```bash
bundle install
```

## Configuration

You can figure how the project runs using [Quke config files](https://github.com/EnvironmentAgency/quke#configuration). Before executing this project for the first time you'll need to create an initial `.config.yml` file.

```bash
touch .config.yml
```

Into that file you'll need to add the `app_host:` entry, with the url of the FRAE environment you wish to test against.

If left as that by default when **Quke** is executed it will run against your selected environment using the headless browser **PhantomJS**.

## Execution

Simply call

```bash
bundle exec quke
```

You can create [multiple config files](https://github.com/EnvironmentAgency/quke#multiple-configs), for example you may wish to have one setup for running against **Chrome**, and another to run against a different environment. You can tell **Quke** which config file to use by adding an environment variable argument to the command.

```bash
QUKE_CONFIG='chrome.config.yml' bundle exec quke
```

## Use of tags

[Cucumber](https://cucumber.io/) has an inbuilt feature called [tags](https://github.com/cucumber/cucumber/wiki/Tags).

These can be added to a [feature](https://github.com/cucumber/cucumber/wiki/Feature-Introduction) or individual **scenarios**.

```gherkin
@functional
Feature: Validations within the digital service
```

```gherkin
@frontoffice @happypath
Scenario: Registration by an individual
```

When applied you then have the ability to filter which tests will be used during any given run

```bash
bundle exec quke --tags @frontoffice # Run only things tagged with this
bundle exec quke --tags @frontoffice,@happypath # Run all things with these tags
bundle exec quke --tags ~@functional # Don't run anything with this tag (run everything else)
```

### In this project

To have consistency across the project the following tags are defined and should be used in the following ways

|Tag|Description|
|---|---|
|@frontoffice|Any feature or scenario expected to be run against the front office application|
|@happypath|A scenario which details a complete registration with no errors|
|@functional|Any feature or scenario which is testing just a specific function of the service e.g. validation errors|
|@ci|A feature that is intended to be run only on our continuous integration service (you should never need to use this tag).|

It's also common practice to use a custom tag whilst working on a new feature or scenario e.g. `@focus` or `@wip`. That is perfectly acceptable but please ensure they are removed before your change is merged.

## Contributing to this project

If you have an idea you'd like to contribute please log an issue.

All contributions should be submitted via a pull request.

## License

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3

The following attribution statement MUST be cited in your products and applications when using this information.

> Contains public sector information licensed under the Open Government license v3

### About the license

The Open Government Licence (OGL) was developed by the Controller of Her Majesty's Stationery Office (HMSO) to enable information providers in the public sector to license the use and re-use of their information under a common open licence.

It is designed to encourage use and re-use of information freely and flexibly, with only a few conditions.
