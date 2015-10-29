# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

    benchmarking Small Input/Main.BufferBuilderMonoid
    time                 2.152 μs   (2.116 μs .. 2.208 μs)
                         0.997 R²   (0.995 R² .. 0.999 R²)
    mean                 2.167 μs   (2.141 μs .. 2.210 μs)
    std dev              107.0 ns   (74.05 ns .. 143.6 ns)
    variance introduced by outliers: 64% (severely inflated)

    benchmarking Small Input/Main.Concat
    time                 1.617 μs   (1.600 μs .. 1.637 μs)
                         0.997 R²   (0.995 R² .. 0.999 R²)
    mean                 1.642 μs   (1.619 μs .. 1.689 μs)
    std dev              103.5 ns   (69.04 ns .. 139.7 ns)
    variance introduced by outliers: 75% (severely inflated)

    benchmarking Small Input/Main.DList, thru list
    time                 1.495 μs   (1.488 μs .. 1.506 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 1.496 μs   (1.492 μs .. 1.505 μs)
    std dev              23.30 ns   (17.41 ns .. 33.54 ns)
    variance introduced by outliers: 15% (moderately inflated)

    benchmarking Small Input/Main.BinaryTree, thru list
    time                 1.317 μs   (1.294 μs .. 1.347 μs)
                         0.993 R²   (0.987 R² .. 0.997 R²)
    mean                 1.390 μs   (1.355 μs .. 1.446 μs)
    std dev              147.9 ns   (125.4 ns .. 181.4 ns)
    variance introduced by outliers: 90% (severely inflated)

    benchmarking Small Input/Main.BinaryTree, explicit allocation
    time                 9.295 μs   (9.072 μs .. 9.637 μs)
                         0.993 R²   (0.985 R² .. 0.999 R²)
    mean                 9.510 μs   (9.270 μs .. 9.866 μs)
    std dev              926.4 ns   (681.7 ns .. 1.143 μs)
    variance introduced by outliers: 86% (severely inflated)

    benchmarking Small Input/Main.BinaryTreeWithSize
    time                 6.166 μs   (6.065 μs .. 6.309 μs)
                         0.996 R²   (0.993 R² .. 0.998 R²)
    mean                 6.416 μs   (6.299 μs .. 6.562 μs)
    std dev              475.5 ns   (412.5 ns .. 545.7 ns)
    variance introduced by outliers: 78% (severely inflated)

    benchmarking Small Input/Data.ByteString.Builder
    time                 1.573 μs   (1.542 μs .. 1.612 μs)
                         0.998 R²   (0.996 R² .. 1.000 R²)
    mean                 1.555 μs   (1.548 μs .. 1.576 μs)
    std dev              39.65 ns   (25.69 ns .. 63.44 ns)
    variance introduced by outliers: 32% (moderately inflated)

    benchmarking Small Input/Data.ByteString
    time                 1.136 μs   (1.129 μs .. 1.146 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 1.135 μs   (1.131 μs .. 1.144 μs)
    std dev              18.01 ns   (12.95 ns .. 28.44 ns)
    variance introduced by outliers: 16% (moderately inflated)

    benchmarking Large Input/Main.BufferBuilderMonoid
    time                 229.1 μs   (226.6 μs .. 232.1 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 228.5 μs   (227.3 μs .. 229.8 μs)
    std dev              4.661 μs   (3.383 μs .. 5.502 μs)
    variance introduced by outliers: 13% (moderately inflated)

    benchmarking Large Input/Main.Concat
    time                 7.342 ms   (7.172 ms .. 7.566 ms)
                         0.995 R²   (0.992 R² .. 0.999 R²)
    mean                 7.444 ms   (7.357 ms .. 7.617 ms)
    std dev              350.8 μs   (235.4 μs .. 521.4 μs)
    variance introduced by outliers: 24% (moderately inflated)

    benchmarking Large Input/Main.DList, thru list
    time                 765.3 μs   (761.4 μs .. 768.8 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 766.9 μs   (764.5 μs .. 773.6 μs)
    std dev              11.92 μs   (6.918 μs .. 21.23 μs)

    benchmarking Large Input/Main.BinaryTree, thru list
    time                 503.1 μs   (498.8 μs .. 509.1 μs)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 502.6 μs   (499.7 μs .. 507.6 μs)
    std dev              11.97 μs   (7.764 μs .. 16.72 μs)
    variance introduced by outliers: 15% (moderately inflated)

    benchmarking Large Input/Main.BinaryTree, explicit allocation
    time                 32.20 ms   (31.65 ms .. 32.75 ms)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 32.49 ms   (32.31 ms .. 32.65 ms)
    std dev              406.3 μs   (297.8 μs .. 552.7 μs)

    benchmarking Large Input/Main.BinaryTreeWithSize
    time                 4.887 ms   (4.703 ms .. 5.153 ms)
                         0.988 R²   (0.978 R² .. 0.997 R²)
    mean                 4.894 ms   (4.809 ms .. 5.002 ms)
    std dev              267.5 μs   (189.4 μs .. 351.3 μs)
    variance introduced by outliers: 33% (moderately inflated)

    benchmarking Large Input/Data.ByteString.Builder
    time                 389.8 μs   (383.9 μs .. 397.3 μs)
                         0.998 R²   (0.995 R² .. 1.000 R²)
    mean                 385.9 μs   (383.5 μs .. 389.5 μs)
    std dev              11.08 μs   (7.484 μs .. 16.70 μs)
    variance introduced by outliers: 21% (moderately inflated)

    benchmarking Large Input/Data.ByteString
    time                 2.275 ms   (2.257 ms .. 2.298 ms)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 2.273 ms   (2.256 ms .. 2.292 ms)
    std dev              53.19 μs   (38.60 μs .. 70.95 μs)
    variance introduced by outliers: 10% (moderately inflated)
