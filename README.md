React Coffescript Demo with Browserify and Gulp within existing Marionette app
==================================

## Notice
This is a proof of concept to add React to
an existing Marionette app.

## Goals
- Add a react app
- Keep Marionette/Backbone separate from the React app to keep React immutable.
  (https://groups.google.com/forum/#!topic/reactjs/lT2pOKXUHY8)
- Only use Marionette to coordinate the switching on and off
of the react app or its own modules.

## Setup

Install npm packages
```
  npm install
```

Install bower packages
```
  bower install
```

Install Gulp Globally
```
  npm install -g gulp
```

Start App
```
  gulp
```

## Instructions for Specific Demos

### Comment Module -- http://facebook.github.io/react/docs/tutorial.html
- Add a directory 'data' to build/ with the following json data:
```
[
  {"author": "Pete Hunt", "text": "This is one comment"},
  {"author": "Jordan Walke", "text": "This is *another* comment"}
]
```

## License
MIT
