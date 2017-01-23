** BBC Automation **

**Setup**
* Mac/OSx
* Firefox Version used (46.0)
* ChromeDriver Version (2.26)
  * I did already placed in cucumber directory, need to make chrome driver executable in terminal by running => "sudo chmod +x cucumber/support/driver/chromedriver"
  * If you prefer Use home brew to install chrome driver.
  ```
   brew install chromedriver
   or else
   Download chrome driver(https://chromedriver.storage.googleapis.com/index.html?path=2.26/) place in path /usr/local/bin/chromedriver
  ```
* Phantomjs (1.9.8) We can use home brew for mac and Linux brew for linux.
 
* Ruby/Cucumber/PageObjects uses ruby-2.2.2*


**List of open source tools been used**
  - Selenium-Webdriver
  - Capybara
  - Poltergeist
  - Phantom-js
  - Cucumber
  - SitePrism
  - Rspec

 - 1.Installing ruby on mac(http://code.tutsplus.com/tutorials/how-to-install-ruby-on-a-mac--net-21664)
 - 2.rvm install 2.2.2
 - 3.rvm use 2.2.2

```sh
 4.$gem install bundler
```
    Navigate to project path $ `cd /BBC-Automation
    
on project directory do
-----------------------

```sh
$bundle install
```
* This will get all the dependency gems from rubygems.org and gems will be place in your project directory in External Libraries.
 - Cucumber.yml provides list of profiles that can be ran and configure
    according to our needs.
 - BBC_Radio_Report.html file will be generated end of the execution with results
 - Screen shots of pages will be taken if scenario.failed?

```
**Example of Execution from command-line in different ways**
============================
```
 - Profiles can be personalised specific to requirements

 - The below command will run all the features in features directory in firefox browser
```sh
cucumber -p test -p firefox -p bbc-radio -p report features/
```
 - The below command will run will only specified tag in chrome broswer
```sh
cucumber -p test -p chrome -p bbc-radio -p report -t @bbc_stations_list
```
- This will run in headless using phanomjsdriver
```sh
cucumber -p test -p phantom -p bbc-radio -p report features/radionav.feature
```
