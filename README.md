# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

    benchmarking Small Input/Main.BufferBuilderMonoid
    time                 2.162 μs   (2.120 μs .. 2.220 μs)
                         0.998 R²   (0.996 R² .. 1.000 R²)
    mean                 2.136 μs   (2.125 μs .. 2.158 μs)
    std dev              52.43 ns   (28.81 ns .. 85.11 ns)
    variance introduced by outliers: 30% (moderately inflated)

    benchmarking Small Input/Main.Concat
    time                 1.643 μs   (1.580 μs .. 1.719 μs)
                         0.991 R²   (0.986 R² .. 1.000 R²)
    mean                 1.607 μs   (1.584 μs .. 1.641 μs)
    std dev              97.42 ns   (43.12 ns .. 151.7 ns)
    variance introduced by outliers: 73% (severely inflated)

    benchmarking Small Input/Main.Seq
    time                 1.424 μs   (1.406 μs .. 1.452 μs)
                         0.994 R²   (0.987 R² .. 0.998 R²)
    mean                 1.488 μs   (1.448 μs .. 1.540 μs)
    std dev              157.6 ns   (122.5 ns .. 199.5 ns)
    variance introduced by outliers: 90% (severely inflated)

    benchmarking Small Input/Main.DList
    time                 1.609 μs   (1.536 μs .. 1.695 μs)
                         0.984 R²   (0.975 R² .. 0.994 R²)
    mean                 1.620 μs   (1.575 μs .. 1.701 μs)
    std dev              195.2 ns   (152.6 ns .. 277.1 ns)
    variance introduced by outliers: 92% (severely inflated)

    benchmarking Small Input/Main.DListWithSize
    time                 6.350 μs   (6.330 μs .. 6.372 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 6.346 μs   (6.329 μs .. 6.375 μs)
    std dev              69.13 ns   (51.18 ns .. 95.22 ns)

    benchmarking Small Input/Main.BinaryTree, thru list
    time                 1.265 μs   (1.257 μs .. 1.274 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 1.274 μs   (1.266 μs .. 1.288 μs)
    std dev              36.21 ns   (23.72 ns .. 57.55 ns)
    variance introduced by outliers: 38% (moderately inflated)

    benchmarking Small Input/Main.BinaryTree, explicit allocation
    time                 9.155 μs   (9.000 μs .. 9.381 μs)
                         0.996 R²   (0.990 R² .. 0.999 R²)
    mean                 9.276 μs   (9.091 μs .. 9.511 μs)
    std dev              706.4 ns   (429.8 ns .. 952.8 ns)
    variance introduced by outliers: 78% (severely inflated)

    benchmarking Small Input/Main.BinaryTreeWithSize
    time                 5.994 μs   (5.971 μs .. 6.021 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 6.099 μs   (6.025 μs .. 6.220 μs)
    std dev              335.2 ns   (233.1 ns .. 477.9 ns)
    variance introduced by outliers: 66% (severely inflated)

    benchmarking Small Input/Data.ByteString.Builder
    time                 1.567 μs   (1.543 μs .. 1.594 μs)
                         0.996 R²   (0.993 R² .. 0.999 R²)
    mean                 1.568 μs   (1.546 μs .. 1.606 μs)
    std dev              98.24 ns   (68.39 ns .. 138.5 ns)
    variance introduced by outliers: 75% (severely inflated)

    benchmarking Small Input/Data.ByteString
    time                 1.125 μs   (1.120 μs .. 1.133 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 1.130 μs   (1.124 μs .. 1.153 μs)
    std dev              40.04 ns   (11.46 ns .. 81.95 ns)
    variance introduced by outliers: 49% (moderately inflated)

    benchmarking Large Input/Main.BufferBuilderMonoid
    time                 237.5 μs   (234.6 μs .. 240.8 μs)
                         0.999 R²   (0.998 R² .. 0.999 R²)
    mean                 234.8 μs   (232.0 μs .. 238.1 μs)
    std dev              8.825 μs   (7.376 μs .. 11.39 μs)
    variance introduced by outliers: 35% (moderately inflated)

    benchmarking Large Input/Main.Concat
    time                 7.737 ms   (7.487 ms .. 7.964 ms)
                         0.992 R²   (0.987 R² .. 0.996 R²)
    mean                 8.182 ms   (8.026 ms .. 8.476 ms)
    std dev              605.2 μs   (421.1 μs .. 888.3 μs)
    variance introduced by outliers: 41% (moderately inflated)

    benchmarking Large Input/Main.Seq
    time                 861.6 μs   (837.8 μs .. 878.7 μs)
                         0.996 R²   (0.994 R² .. 0.997 R²)
    mean                 836.7 μs   (822.5 μs .. 855.3 μs)
    std dev              48.41 μs   (39.75 μs .. 60.13 μs)
    variance introduced by outliers: 48% (moderately inflated)

    benchmarking Large Input/Main.DList
    time                 765.5 μs   (758.4 μs .. 774.8 μs)
                         0.997 R²   (0.993 R² .. 0.999 R²)
    mean                 803.2 μs   (789.9 μs .. 822.0 μs)
    std dev              54.05 μs   (36.69 μs .. 73.81 μs)
    variance introduced by outliers: 56% (severely inflated)

    benchmarking Large Input/Main.DListWithSize
    time                 5.381 ms   (5.155 ms .. 5.651 ms)
                         0.987 R²   (0.980 R² .. 0.995 R²)
    mean                 5.171 ms   (5.068 ms .. 5.296 ms)
    std dev              338.4 μs   (252.6 μs .. 419.9 μs)
    variance introduced by outliers: 39% (moderately inflated)

    benchmarking Large Input/Main.BinaryTree, thru list
    time                 508.3 μs   (498.3 μs .. 518.9 μs)
                         0.997 R²   (0.996 R² .. 0.999 R²)
    mean                 511.8 μs   (505.0 μs .. 519.1 μs)
    std dev              22.29 μs   (15.09 μs .. 27.71 μs)
    variance introduced by outliers: 37% (moderately inflated)

    benchmarking Large Input/Main.BinaryTree, explicit allocation
    time                 31.51 ms   (31.09 ms .. 32.02 ms)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 32.09 ms   (31.86 ms .. 32.45 ms)
    std dev              661.0 μs   (465.1 μs .. 888.5 μs)

    benchmarking Large Input/Main.BinaryTreeWithSize
    time                 5.385 ms   (5.126 ms .. 5.603 ms)
                         0.989 R²   (0.984 R² .. 0.996 R²)
    mean                 5.334 ms   (5.244 ms .. 5.471 ms)
    std dev              314.9 μs   (242.1 μs .. 389.5 μs)
    variance introduced by outliers: 34% (moderately inflated)

    benchmarking Large Input/Data.ByteString.Builder
    time                 398.4 μs   (388.3 μs .. 408.5 μs)
                         0.996 R²   (0.995 R² .. 0.998 R²)
    mean                 400.9 μs   (395.1 μs .. 408.4 μs)
    std dev              21.98 μs   (18.43 μs .. 25.49 μs)
    variance introduced by outliers: 50% (severely inflated)

    benchmarking Large Input/Data.ByteString
    time                 2.350 ms   (2.186 ms .. 2.565 ms)
                         0.943 R²   (0.911 R² .. 0.977 R²)
    mean                 2.549 ms   (2.436 ms .. 2.683 ms)
    std dev              455.9 μs   (368.8 μs .. 537.7 μs)
    variance introduced by outliers: 88% (severely inflated)
