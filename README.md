== This is a sample rails 3 application with cucumber test
The purpose of this application is to guide new cucumber users to use cucumber easily with rails 3.
This project is under construction please subscribe till the example is complete.

== Contents for cucumber

The default directory structure of a generated Ruby on Rails application:

  |-- app
  |   |-- ...
  |-- features
  |   `-- step_definitions
  |   `-- support
  |   |-- *.features
  |-- spec
  |   `-- fabricators
  |       |-- *.rb

== Running the test
```console
cucumber features --guess
```
Running with guess handles some of the ambiguous feature definitions.

== References

* [Cucumber page object pattern](http://jitu-blog.blogspot.com/2011/12/jbehave-web-and-page-object-pattern.html)
* [Another blog on cucumber page object pattern](http://blog.josephwilk.net/cucumber/page-object-pattern.html)