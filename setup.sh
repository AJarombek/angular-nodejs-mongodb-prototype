#!/usr/bin/env bash

# Create a new Angular CLI application
ng new web-app

cd web-app
ng serve --aot --no-sourcemap

# Generate a new component named home in the app module
ng generate component home

# Make more components
ng generate component about
ng generate component login
ng generate component signup

ng generate module profile

ng generate component profile/post

# Convert the style sheets to use Sass
ng set defaults.styleExt scss

# Set up code coverage with coveralls
npm install karma-coveralls --save-dev

# Create a new tag at the time of the routing and lazy loading discovery.  Push this tag to origin
git tag -a v0.1 -m "Prototype at time of discovery: Angular 5 Routing & Lazy Loading Modules"
git push origin v0.1

# Install bootstrap to help style our web pages
npm install bootstrap --save
npm install ngx-bootstrap --save

# Fix bug with the newest beta version of bootstrap
# https://github.com/angular/angular-cli/issues/9020
npm uninstall bootstrap --save
npm install bootstrap@4.0.0-beta.2 --save

# Create a new service called 'post' and a mock post for testing
ng generate service post
ng generate service mock/mock-post

ng generate component cat-picture

ng generate service authentication
ng generate service profile
ng generate service loaded
ng generate service username

# An npm module for uploading pictures in Angular 2+
npm install angular2-image-upload --save

ng generate directive spy
ng generate service lifecycle

# Moment helps us deal with time in an angular application
npm install moment --save

# Serve the application in our DEV environment with a proxy.  The proxy is configured in proxy.config.json
# The proxy sits in between the Angular app and the Node.js backend API.  The proxy hijacks URL's and sends them
# to the backend.  We use it to avoid CORS errors (Cross-Origin Resource Sharing).
# https://juristr.com/blog/2016/11/configure-proxy-api-angular-cli/
ng serve --proxy-config proxy.config.json

# Perform a test that will close after the test is over.  Also report code coverage statistics
ng test --single-run --watch=false --code-coverage -sm=false
