# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

    benchmarking Small Input/Main.BufferBuilderMonoid
    time                 2.172 μs   (2.116 μs .. 2.221 μs)
                         0.997 R²   (0.996 R² .. 0.999 R²)
    mean                 2.127 μs   (2.109 μs .. 2.154 μs)
    std dev              68.55 ns   (42.22 ns .. 99.37 ns)
    variance introduced by outliers: 43% (moderately inflated)

    benchmarking Small Input/Main.Concat
    time                 1.589 μs   (1.571 μs .. 1.616 μs)
                         0.996 R²   (0.993 R² .. 0.998 R²)
    mean                 1.657 μs   (1.626 μs .. 1.706 μs)
    std dev              131.7 ns   (110.6 ns .. 162.1 ns)
    variance introduced by outliers: 83% (severely inflated)

    benchmarking Small Input/Main.Seq
    time                 1.385 μs   (1.376 μs .. 1.397 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 1.384 μs   (1.377 μs .. 1.397 μs)
    std dev              31.93 ns   (13.80 ns .. 60.13 ns)
    variance introduced by outliers: 28% (moderately inflated)

    benchmarking Small Input/Main.DList
    time                 1.496 μs   (1.487 μs .. 1.506 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 1.495 μs   (1.488 μs .. 1.507 μs)
    std dev              31.26 ns   (16.79 ns .. 46.15 ns)
    variance introduced by outliers: 24% (moderately inflated)

    benchmarking Small Input/Main.DListWithSize
    time                 6.273 μs   (6.249 μs .. 6.298 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 6.267 μs   (6.246 μs .. 6.287 μs)
    std dev              66.26 ns   (50.51 ns .. 85.86 ns)

    benchmarking Small Input/Main.BinaryTree, thru list
    time                 1.283 μs   (1.279 μs .. 1.289 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 1.286 μs   (1.282 μs .. 1.299 μs)
    std dev              25.29 ns   (12.95 ns .. 51.24 ns)
    variance introduced by outliers: 23% (moderately inflated)

    benchmarking Small Input/Main.BinaryTree, explicit allocation
    time                 8.943 μs   (8.909 μs .. 8.998 μs)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 9.108 μs   (8.991 μs .. 9.306 μs)
    std dev              546.3 ns   (367.5 ns .. 851.5 ns)
    variance introduced by outliers: 69% (severely inflated)

    benchmarking Small Input/Main.BinaryTreeWithSize
    time                 5.958 μs   (5.933 μs .. 5.985 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 5.959 μs   (5.939 μs .. 5.992 μs)
    std dev              101.5 ns   (54.99 ns .. 170.7 ns)
    variance introduced by outliers: 16% (moderately inflated)

    benchmarking Small Input/Main.ListT
    time                 2.414 μs   (2.405 μs .. 2.428 μs)
                         0.998 R²   (0.997 R² .. 0.999 R²)
    mean                 2.541 μs   (2.481 μs .. 2.647 μs)
    std dev              257.9 ns   (198.2 ns .. 314.6 ns)
    variance introduced by outliers: 88% (severely inflated)

    benchmarking Small Input/List
    time                 1.287 μs   (1.251 μs .. 1.329 μs)
                         0.995 R²   (0.993 R² .. 0.998 R²)
    mean                 1.261 μs   (1.244 μs .. 1.284 μs)
    std dev              64.96 ns   (42.47 ns .. 89.79 ns)
    variance introduced by outliers: 67% (severely inflated)

    benchmarking Small Input/Data.ByteString.Builder
    time                 1.597 μs   (1.558 μs .. 1.647 μs)
                         0.994 R²   (0.992 R² .. 0.998 R²)
    mean                 1.594 μs   (1.563 μs .. 1.635 μs)
    std dev              110.3 ns   (82.65 ns .. 138.2 ns)
    variance introduced by outliers: 79% (severely inflated)

    benchmarking Small Input/Data.ByteString
    time                 1.223 μs   (1.185 μs .. 1.272 μs)
                         0.991 R²   (0.988 R² .. 0.995 R²)
    mean                 1.275 μs   (1.239 μs .. 1.313 μs)
    std dev              123.7 ns   (111.4 ns .. 145.5 ns)
    variance introduced by outliers: 88% (severely inflated)

    benchmarking Large Input/Main.BufferBuilderMonoid
    time                 210.6 μs   (209.2 μs .. 212.6 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 212.6 μs   (211.0 μs .. 214.3 μs)
    std dev              5.172 μs   (4.668 μs .. 6.107 μs)
    variance introduced by outliers: 19% (moderately inflated)

    benchmarking Large Input/Main.Concat
    time                 8.176 ms   (7.453 ms .. 9.063 ms)
                         0.951 R²   (0.927 R² .. 0.976 R²)
    mean                 7.818 ms   (7.536 ms .. 8.135 ms)
    std dev              982.2 μs   (715.5 μs .. 1.340 ms)
    variance introduced by outliers: 69% (severely inflated)

    benchmarking Large Input/Main.Seq
    time                 812.0 μs   (796.5 μs .. 827.3 μs)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 802.6 μs   (799.8 μs .. 807.9 μs)
    std dev              14.18 μs   (8.792 μs .. 20.93 μs)

    benchmarking Large Input/Main.DList
    time                 731.8 μs   (728.8 μs .. 734.7 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 736.0 μs   (733.0 μs .. 741.3 μs)
    std dev              13.40 μs   (6.366 μs .. 22.09 μs)

    benchmarking Large Input/Main.DListWithSize
    time                 5.355 ms   (5.145 ms .. 5.550 ms)
                         0.990 R²   (0.984 R² .. 0.995 R²)
    mean                 5.096 ms   (4.989 ms .. 5.205 ms)
    std dev              324.5 μs   (281.8 μs .. 379.4 μs)
    variance introduced by outliers: 38% (moderately inflated)

    benchmarking Large Input/Main.BinaryTree, thru list
    time                 515.8 μs   (506.9 μs .. 527.3 μs)
                         0.998 R²   (0.997 R² .. 0.999 R²)
    mean                 518.5 μs   (512.3 μs .. 525.7 μs)
    std dev              24.02 μs   (19.41 μs .. 30.62 μs)
    variance introduced by outliers: 40% (moderately inflated)

    benchmarking Large Input/Main.BinaryTree, explicit allocation
    time                 32.74 ms   (31.33 ms .. 34.18 ms)
                         0.990 R²   (0.970 R² .. 0.998 R²)
    mean                 32.49 ms   (31.82 ms .. 34.11 ms)
    std dev              2.020 ms   (991.7 μs .. 3.412 ms)
    variance introduced by outliers: 22% (moderately inflated)

    benchmarking Large Input/Main.BinaryTreeWithSize
    time                 5.092 ms   (4.870 ms .. 5.320 ms)
                         0.989 R²   (0.983 R² .. 0.994 R²)
    mean                 5.100 ms   (5.014 ms .. 5.217 ms)
    std dev              322.1 μs   (279.2 μs .. 373.3 μs)
    variance introduced by outliers: 38% (moderately inflated)

    benchmarking Large Input/Main.ListT
    time                 114.0 ms   (108.5 ms .. 120.8 ms)
                         0.996 R²   (0.992 R² .. 1.000 R²)
    mean                 118.1 ms   (115.2 ms .. 124.3 ms)
    std dev              5.825 ms   (1.405 ms .. 8.493 ms)
    variance introduced by outliers: 11% (moderately inflated)

    benchmarking Large Input/List
    time                 47.35 ms   (43.73 ms .. 52.52 ms)
                         0.981 R²   (0.953 R² .. 0.994 R²)
    mean                 51.15 ms   (49.16 ms .. 53.55 ms)
    std dev              3.819 ms   (2.995 ms .. 4.914 ms)
    variance introduced by outliers: 22% (moderately inflated)

    benchmarking Large Input/Data.ByteString.Builder
    time                 358.7 μs   (356.1 μs .. 360.9 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 359.8 μs   (357.8 μs .. 361.9 μs)
    std dev              6.486 μs   (5.344 μs .. 7.922 μs)
    variance introduced by outliers: 10% (moderately inflated)

    benchmarking Large Input/Data.ByteString
    time                 2.162 ms   (2.128 ms .. 2.197 ms)
                         0.990 R²   (0.978 R² .. 0.997 R²)
    mean                 2.349 ms   (2.279 ms .. 2.466 ms)
    std dev              277.6 μs   (193.4 μs .. 404.7 μs)
    variance introduced by outliers: 75% (severely inflated)
