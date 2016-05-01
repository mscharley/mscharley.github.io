I've heard analogies in the past of programmers building applications being
like putting together a jigsaw puzzle---programming languages and libraries
being puzzle pieces slotted together. I think this is a pretty apt description
of things but I'd like to take the analogy a few steps further.

The puzzle
----------

Projects. We get them all the time. Each is a puzzle we lay out on the table
and look at and try to solve. All the pieces are different sizes and shapes.
Our jobs as engineers then is to pick the pieces that fit together the best
to create the shape we are aiming for.

More than ever application development isn't about creating something new,
it's about knowing what's available and fitting together the pieces that
already exist to create something novel.

The pieces
----------

Frameworks. Libraries. Even entire languages, sometimes more than one of them,
get incorporated into our puzzle. Some pieces fit together well with other
pieces and sometimes two pieces just won't mesh together at all.

Groups of pieces tend to form particular shapes or patterns. We constantly keep
trying to fit different pieces together and inevitably make a few of our own
pieces to help fill in the gaps in the shape we're trying to form.

*Except there's still something missing...*

The Big Picture
---------------

Every jigsaw has a picture. It's usually the major point of the puzzle---put
together the jigsaw and then you can appreciate the pretty pictures you can see.

There's a pretty glaring problem here. All those pieces we mentioned; they are
pieces of other peoples puzzle. Pieces that we've appropriated and melded into
our own puzzle. The puzzle is put together and has the right shape but the
picture is muddled. At best it is blank; the original authors foresaw this
problem and deliberately tried to avoid painting their own image on their
pieces. At worst we have an image that looks like a paint blot.

This concept applies at many levels---in application architecture where it
can feel like we're trying to paint all our pieces to fit what we need
*before* slotting them into place and praying for the best when we're done,
in UI design where it can be a literal image that's created by various
components in the system that may not work together very well, in UX where
disparate ideas and ideologies can create a system that is difficult to use.

As engineers it can be easy to lose sight of what we're creating. It's far too
easy to focus on the pieces of the puzzle and lose track of the picture we're
trying to create---focus on tools and processes instead of what we're using
them to create.

The Small Picture
-----------------

*Or, a treatise on modular design.*

Extending the metaphor to breaking point, it's easier to solve many small
puzzles than one large puzzle. The common answer to this is black-box modules
whether this takes the form of a plugin system or a full-blown service-oriented
architecture.

From a human perspective this make a lot of sense. It's easier to solve small
well defined problems. It's easier to keep track of all the pieces and easier
to keep the whole picture in mind when there are fewer pieces forming a smaller
image.
