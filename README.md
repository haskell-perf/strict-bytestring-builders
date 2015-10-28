# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

    benchmarking Data.ByteString
    time                 1.118 μs   (1.112 μs .. 1.124 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 1.117 μs   (1.114 μs .. 1.123 μs)
    std dev              14.69 ns   (11.77 ns .. 20.30 ns)
    variance introduced by outliers: 12% (moderately inflated)

    benchmarking Data.ByteString.Builder
    time                 1.612 μs   (1.561 μs .. 1.666 μs)
                         0.994 R²   (0.991 R² .. 0.998 R²)
    mean                 1.648 μs   (1.603 μs .. 1.691 μs)
    std dev              156.9 ns   (124.3 ns .. 181.7 ns)
    variance introduced by outliers: 87% (severely inflated)

    benchmarking Main.BinaryTree
    time                 1.282 μs   (1.276 μs .. 1.291 μs)
                         0.999 R²   (0.998 R² .. 0.999 R²)
    mean                 1.335 μs   (1.310 μs .. 1.363 μs)
    std dev              111.7 ns   (83.96 ns .. 139.7 ns)
    variance introduced by outliers: 85% (severely inflated)

    benchmarking Main.BinaryTreeWithSize
    time                 6.060 μs   (6.019 μs .. 6.122 μs)
                         0.998 R²   (0.995 R² .. 0.999 R²)
    mean                 6.207 μs   (6.106 μs .. 6.391 μs)
    std dev              438.9 ns   (305.6 ns .. 602.6 ns)
    variance introduced by outliers: 77% (severely inflated)
