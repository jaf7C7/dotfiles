# How To Set Up A Basic JavaScript Project

```
$ npm init
$ npm init @eslint/config@latest
$ npm install --save-dev prettier jest @babel/preset-env
```

`npm init` will prompt you for project information which is used to create a
`package.json` file for your project.

`npm init @eslint/config@latest` will prompt you for more project information
which is used to create an `eslint.config.js` file.

`prettier` is our chosen formatter.

`jest` is our testing framework of choice.

`@babel/preset-env` is a set of presets for `babel` which `jest` calls
implicitly to transpile your code to be compatible with different versions of
javascript.

In order to use newer browser-compatible ES6 `import` syntax, instead of older
node-specific `require` syntax, we need to add some configuration to
`package.json`:

**Without this configuration you will get `SyntaxError: Cannot use import
statement outside a module` when trying to run your tests.**

```
{
  ...
  "type": "module",
  ...
  "babel": {
    "presets": [
      [
        "@babel/preset-env",
        {
          "targets": {
            "node": "current"
          }
        }
      ]
    ]
  }
}
```

This will apply the correct `babel` presets so your code will be transpiled to
target the currently installed version of node.

We can also add some useful scripts to `package.json` to run with `npm run <script>`:

```
{
  ...
  "scripts": {
    "test": "jest",
    "format": "prettier",
    "lint": "eslint",
    "watch": "nodemon --exec \"sh -c 'eslint && jest && prettier'\"
  }
}
```

Now you can write tests using ES6 module syntax and run them using `jest`, and
`babel` will be invoked by `jest` to transpile your code into something which
it can run.

For example:

```javascript
// `jest` will run the tests fine without this line but `eslint` will
// complain if it's missing.
import { test, expect } from '@jest/globals';
import next from './life.js';

test('a live cell with no neighbours dies', () => {
    cells = [(0, 0)];
    expect(next(cells)).toEqual([]);
});
```

## File watchers

These can be installed locally, but it's easier to just run them with `npx`:

```
# `onchange` has nicer interface as you don't have to quote everything.
$ npx onchange <glob> -- <command> [<arg>...]
$ npx nodemon --watch <glob> --exec '<command> [<arg>...]'
```

## Sources:

[Writing Tests That Don’t Suck - Test Driven Development in JavaScript | David
Whitney](https://www.youtube.com/watch?v=wVNTQHM-a0Y)

[Getting Started - Jest](https://jestjs.io/docs/getting-started)

[Getting Started - ESLint](https://eslint.org/docs/latest/use/getting-started)
