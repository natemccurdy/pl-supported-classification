# Classification for Puppet Labs Supported Modules

This is a collection of example classification for all of the Puppet Labs supported modules from [The Forge](https://forge.puppetlabs.com).

**tl;dr** The [classification folder](classification) has examples of valid Puppet code that wraps the Forge modules into profiles and does basic things with them.

## So, how do I use this?

### Preparation:

1. First, clone this repository, and `cd` into it.

  ```shell
  git clone git@github.com:natemccurdy/pl-supported-classification.git
  cd pl-supported-classification
  ```
2. Next, we're going to need the supported modules from the Forge. This can be accomplished using [R10k](https://github.com/puppetlabs/r10k) and a [specialized Puppetfile](Puppetfile) that's included in this repo. **If you already have R10k installed**, this is the command to run:

  ``` shell
  r10k puppetfile install -v
  ```
**If you don't have R10k**, you can install it manually using the `gem` command. Or, use [Bundler](http://bundler.io) to automate that. Here's how to use Bundler to install R10k and download the Forge modules:

  ```shell
  gem install bundle
  bundle install
  r10k puppetfile install -v
  ```

### Classification:

1. Inside of the `classification` folder are examples of using the [Roles](https://puppetlabs.com/presentations/designing-puppet-rolesprofiles-pattern) and [Profiles](http://garylarizza.com/blog/2014/02/17/puppet-workflow-part-2/) design pattern to implement application-specific modules (in this case, supported modules from the forge).
2. I've made [profiles](classification/profiles/manifests/) for each of the component modules, named after the module from the forge.

  **NOTE**: These profiles are super basic as of now, and I just pulled examples from the test folders for README's from each Forge module. I absolutely welcome and encourage pull requests to add more real world examples of using these Forge modules.

### Usage:

 - There is a Vagrantfile in this repo that spins up a Puppet Enterprise Master and sets the `$basemodulepath` to include the `./modules` and `./classificaion` folders from this repository.

 Other PE agents can be added to the Vagrant environment and classification applied to those agents to test out these roles and profiles. (TODO: do this)

 To use this Vagrant box, run:

 ```shell
 vagrant up
 vagrant ssh
 ```

## Improvements

  - **Please contribute example classification for these Forge modules as roles or profiles**. The idea with this repo is to get few real-world examples of how these modules are being used by large-scale endusers. That way, Puppet can be tested at high scale and with real-world load, so that bugs can be found earlier than later.
  - **Automate the creation of classification**. I'm sure there's a sane way to parse out parameters, usage, and examples from the Puppet code of these modules. Using that, working classification can me dynamically created to test all the resources, functions, logic, and whatnot that a Forge Module has.
    - To assist in that, I started playing with [puppet-parse](https://github.com/johanek/puppet-parse). This parses out all the parameters and classes from a Puppet module. To see what I mean, run the following command from inside this repo.

      ```shell
      rake parse
      ```

    - There's also the ability to use Puppet itself to parse out all the usable bits of code. An example of that is in the [native-parse](native-parser) folder. You can run `ruby parse.rb <path/to/manifest.pp>`.

      NOTE: This uses the Puppet gem. If you have Puppet installed already and not from a gem (like me. I have the PE agent installed.), use rbenv to switch to a new environment, then `gem install bundle; bundle install` from inside the native-parse folder before running the parse.rb file.
