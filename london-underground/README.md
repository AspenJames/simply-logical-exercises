# London Underground

![Part of the London Undeground](https://book.simply-logical.space/img/part_i/image002.svg)

> From _Simply Logical_, Figure 1.1

## Exercise 1.1

I took a bit of a different approach from what is shown in the book to set up
the knowledge base for the London Underground. In _Simply Logical_, the
connections between stations were modeled from left to right, top to bottom via
the `connected/3` predicate. This worked okay for a simple model of the subway
map, but had a major flaw of not working with inverse relationships --
`connected(bond_street,oxford_circus,central)` is true, but
`connected(oxford_circus,bond_street,central)` is false. Most transit systems
work in both directions, so I defined `connected/3` in terms of a "helper"
predicate, `connection/3`, that handles the inverse relationships:

```prolog
connected(A, B, Line) :- connection(A, B, Line);
                         connection(B, A, Line).
```

This allowed me to fully declare the relationship between two adjacent stations
on a line with a single predicate. Since the `nearby/2` and `not_too_far/2`
predicates are defined in terms of the `connected/3` predicate, they can benefit
from the "inverse" connection relationships as well. Now, when we state that
`bond_street` and `oxford_circus` have a `connection` on the `central` line with
`connection(bond_street,oxford_circus,central).`, both
`nearby(bond_street,oxford_circus)` and `nearby(oxford_circus,bond_street)` are
true.

I also am not fully familiar with Prolog's module system, but am trying to start
with good habits! SWI-Prolog's [reference
documentation](https://www.swi-prolog.org/pldoc/man?section=whymodules) is where
I'll be diving in for that!