### Powder for your browser!
A simple web server interface to powder CLI for pow! This gives you the ability to create a bookmark button in your browser that will restart your development app and redirect to the root url.

### Features
* Application Restart
 	* Restarts a linked application and redirects to it's root url
		* Browse to `http://prowser.dev/restart`
	* Redirect to a custom url by passing in the `redirect` parameter to the action
		* `http://prowser.dev/restart?redirect=www.appname.dev`

### How do I setup Prowser?
From scratch:

```sh
cd path/to/pow/app
gem install prowser
prowser start
```

Link prowser to an app with a custom appname:

```sh
prowser start appname
```

Stop the prowser server

```sh
prowser stop
```

Restart the prowser server

```sh
prowser restart
```

### Troubleshooting
Sometimes you will get an error related to changing directory. If that happen just restart the powser server with `powser restart` and life will be good.