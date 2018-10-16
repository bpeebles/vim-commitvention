vim-commitvention
=================

The goal is a set of nice things that you'd want Vim to do and figure out everytime you open up a
commit message, targetting Git, GitHub, and JIRA first.

If `vim-fugitive`_ is loaded, this will use it!

What it does
------------

The convention of where I work currently is to put the ticket identifier, which is also the branch
name, leading the commit subject as follows::

    PRJ-432 Add reply-all to email feature

    This finally adds reply-all to email but currently normal "reply"
    is still the default.

This will pick up the branch ID, if it can find it, from the default Git commit message template and
prepend it to the first line with a following space.

What's next
-----------

This is my first published Vim plugin so I know it's tiny and may go nowhere. It's useful to me, so
there may be more ticketing systems, conventions, and cool stuff coming.

Self-links
----------

It's on GitHub as `vim-commitvention <https://github.com/bpeebles/vim-commitvention>`_. I'm bpeebles
on `Twitter <https://twitter.com/bpeebles>`_ and `GitHub <https://github.com/bpeebles>`_.

License
-------

Copyright 2018, Byron Peebles. Distributed under the same terms as Vim itself. See ``:help
license``.


.. _`vim-fugitive`: https://github.com/tpope/vim-fugitive
