# Productive Sublime Snippets for Ruby

## Style

- Only Ruby snippets
- Focus on Ruby core and common standard snippets
- No gem specific snippets, except for stdlib, bundler and rake

## Install

- Search in Sublime's package control for "ProductiveSnippetsRuby" OR
- Clone into a directory in your Sublime Text Packages folder
- [Delete interfering Ruby snippets](http://ruby.janlelis.de/71-be-more-productive-with-better-sublime-snippets-for-ruby)

## Included snippets

- See [CHEATSHEET.md](https://github.com/janlelis/productive-sublime-snippets-ruby/blob/master/CHEATSHEET.md)

## Custom Shortcuts / Wrap around Selection

You can map keys to insert a specific snippet. This makes especially sense for snippets that can be wrapped around the current selection. A good example would be wrapping the selection in a Begin / Rescue statement. To do so when ALT+SHIFT+R is pressed, add this to your keymap file:

```json
{
  "keys"      :   ["alt+shift+r"],
  "command"   :   "insert_snippet",
  "args": {
    "name": "Packages/ProductiveSnippetsRuby/begin.sublime-snippet"
  }
}
```

## Also See

- [Productive Sublime Snippets for ERB](https://github.com/janlelis/productive-sublime-snippets-erb)

## J-_-L

MIT
