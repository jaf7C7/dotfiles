# How To Load A Script In The Node REPL

Either load directly in the repl:

```
> .load 'myScript.js'
```

But this can cause errors e.g. if you use ES6 modules syntax
(`import`/`export`) as the REPL does not count as a module.

Alternative and best way: Wrangle the file data to remove the offending
statements and load it into the repl straight from the shell:

```
$ node -i -e "$(sed -E '/import/d;s/export //' myScript.js)"
```

If your script is more complex you might need to write a longer `sed` script,
or possibly transpile the script using `babel`.
