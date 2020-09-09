# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

```
averagedAppends-1/byteStringStrictBuilder mean 93.19 ns  ( +- 4.125 ns  )
averagedAppends-1/byteStringTreeBuilder  mean 167.4 ns  ( +- 14.62 ns  )
averagedAppends-1/fastBuilder            mean 167.3 ns  ( +- 5.783 ns  )
averagedAppends-1/bufferBuilder          mean 729.3 ns  ( +- 36.52 ns  )
averagedAppends-1/byteString             mean 487.2 ns  ( +- 16.07 ns  )
averagedAppends-1/blazeBuilder           mean 477.9 ns  ( +- 19.70 ns  )
averagedAppends-1/binary                 mean 881.0 ns  ( +- 88.45 ns  )
averagedAppends-1/cereal                 mean 931.4 ns  ( +- 16.47 ns  )
averagedAppends-100/byteStringStrictBuilder mean 5.462 μs  ( +- 147.8 ns  )
averagedAppends-100/byteStringTreeBuilder mean 12.08 μs  ( +- 530.1 ns  )
averagedAppends-100/fastBuilder          mean 11.96 μs  ( +- 571.8 ns  )
averagedAppends-100/bufferBuilder        mean 27.19 μs  ( +- 529.7 ns  )
averagedAppends-100/byteString           mean 22.39 μs  ( +- 356.5 ns  )
averagedAppends-100/blazeBuilder         mean 22.30 μs  ( +- 735.2 ns  )
averagedAppends-100/binary               mean 54.96 μs  ( +- 420.8 ns  )
averagedAppends-100/cereal               mean 51.17 μs  ( +- 1.795 μs  )
averagedAppends-10000/byteStringStrictBuilder mean 873.0 μs  ( +- 44.55 μs  )
averagedAppends-10000/byteStringTreeBuilder mean 1.937 ms  ( +- 113.1 μs  )
averagedAppends-10000/fastBuilder        mean 1.675 ms  ( +- 152.7 μs  )
averagedAppends-10000/bufferBuilder      mean 2.608 ms  ( +- 44.49 μs  )
averagedAppends-10000/byteString         mean 3.041 ms  ( +- 30.87 μs  )
averagedAppends-10000/blazeBuilder       mean 3.074 ms  ( +- 134.0 μs  )
averagedAppends-10000/binary             mean 7.342 ms  ( +- 85.79 μs  )
averagedAppends-10000/cereal             mean 6.888 ms  ( +- 126.7 μs  )
regularConcat-100/byteStringStrictBuilder mean 1.509 μs  ( +- 73.75 ns  )
regularConcat-100/byteStringTreeBuilder  mean 1.815 μs  ( +- 102.0 ns  )
regularConcat-100/fastBuilder            mean 1.143 μs  ( +- 48.74 ns  )
regularConcat-100/bufferBuilder          mean 1.672 μs  ( +- 48.93 ns  )
regularConcat-100/byteString             mean 1.231 μs  ( +- 66.51 ns  )
regularConcat-100/blazeBuilder           mean 1.194 μs  ( +- 40.81 ns  )
regularConcat-100/binary                 mean 3.295 μs  ( +- 101.2 ns  )
regularConcat-100/cereal                 mean 3.433 μs  ( +- 176.2 ns  )
regularConcat-10000/byteStringStrictBuilder mean 299.2 μs  ( +- 7.463 μs  )
regularConcat-10000/byteStringTreeBuilder mean 313.9 μs  ( +- 10.63 μs  )
regularConcat-10000/fastBuilder          mean 99.43 μs  ( +- 1.920 μs  )
regularConcat-10000/bufferBuilder        mean 125.7 μs  ( +- 3.425 μs  )
regularConcat-10000/byteString           mean 101.3 μs  ( +- 1.727 μs  )
regularConcat-10000/blazeBuilder         mean 94.81 μs  ( +- 1.588 μs  )
regularConcat-10000/binary               mean 352.4 μs  ( +- 7.676 μs  )
regularConcat-10000/cereal               mean 376.0 μs  ( +- 8.379 μs  )
```
