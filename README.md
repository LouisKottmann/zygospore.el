# zygospore

## Introduction

`zygospore` lets you revert `C-x 1` (`delete-other-window`) by pressing `C-x 1` again

## Example

*Click the gif then select "raw" for fullscreen*

![demo.gif](demo.gif)

## Installation

Install from MELPA: `M-x package-install RET zygospore RET`

Test it out with `M-x zygospore-toggle-delete-other-windows RET` (twice, on a frame with multiple windows)

To make it permanent, add this line to your `init.el`:

`(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)`

## Not so useful information

I was inspired by the same functionality that is present out-of-the-box in tmux, and which I use a lot to momentarily "zoom in" on a buffer. Check out [my tmux config](https://github.com/LouisKottmann/baboon-bash/blob/master/.tmux.conf#L20) for the same thing with the same binding in tmux.

Of course it can be replicated by `C-x 1` `C-c <left arrow>` (`winner-undo`) but why 2 bindings when you could toggle?!

This is my first attempt at making a tidy package for Emacs while providing a *hopefully* useful command, sorry if you came here looking for a next-gen dynamic language auto-completion ;)

## Why zygospore?

From [wikipedia](https://en.wikipedia.org/wiki/Zygospore):

> A zygospore remains dormant while it waits for environmental cues, such as light, moisture, heat,
> or chemicals secreted by plants. When the environment is favorable, the zygospore germinates,
> meiosis occurs, and haploid vegetative cells are released.

Ah, sweet poetry of nature.

In Emacs, that means putting the windows displayed in a spore formation to let them return with a subsequent C-x 1 environment (a.k.a "favorable environment).

## Thanks

You can now get back to a *normal* activity
