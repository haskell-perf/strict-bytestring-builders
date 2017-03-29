# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

"bytestring-strict-builder" and "bytestring-tree-builder" seem to be the winners on average. "fast-builder" and "buffer-builder" often show good results. In all tests the standard builder and hence its offspring-solutions like "cereal" and "binary" seems dominated.

* [averagedAppends-1](http://haskell-perf.github.io/strict-bytestring-builders/results/averagedAppends-1.html)
* [averagedAppends-100](http://haskell-perf.github.io/strict-bytestring-builders/results/averagedAppends-100.html)
* [averagedAppends-10000](http://haskell-perf.github.io/strict-bytestring-builders/results/averagedAppends-10000.html)
* [regularConcat-100](http://haskell-perf.github.io/strict-bytestring-builders/results/regularConcat-100.html)
* [regularConcat-10000](http://haskell-perf.github.io/strict-bytestring-builders/results/regularConcat-10000.html)
