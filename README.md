### Powder for your browser!
A simple web server interface to [powder](https://rubygems.org/gems/powder) CLI for [pow](http://pow.cx/)! This gives you the ability to create a bookmark button in your browser that will restart your development app and redirect to the root url.

### Features
* Application Restart
 	* Restarts a linked application and redirects to it's root url
		* Browse to `http://powser.dev/restart`
	* Redirect to a custom url by passing in the `redirect` parameter to the action
		* `http://powser.dev/restart?redirect=www.appname.dev`
	* Restart any of your pow apps by passing the `app` parameter the action
		* `http://powser.dev/restart?app=appname`

### How do I setup Powser?
From scratch:

```sh
cd path/to/pow/app
gem install powser
powser start
```

Link powser to an app with a custom appname:

```sh
powser start appname
```

Stop the powser server

```sh
powser stop
```

Restart the powser server

```sh
powser restart
```

### Troubleshooting
Sometimes you will get an error related to changing directory. If that happen just restart the powser server with `powser restart` and life will be good.