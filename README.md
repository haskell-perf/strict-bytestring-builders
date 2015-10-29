# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

    benchmarking Small Input/Main.BinaryTree, explicit allocation
    time                 2.358 μs   (2.339 μs .. 2.381 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 2.347 μs   (2.336 μs .. 2.365 μs)
    std dev              49.08 ns   (33.32 ns .. 67.94 ns)
    variance introduced by outliers: 24% (moderately inflated)

    benchmarking Small Input/Main.BinaryTree, thru list
    time                 1.385 μs   (1.332 μs .. 1.428 μs)
                         0.994 R²   (0.994 R² .. 0.997 R²)
    mean                 1.334 μs   (1.319 μs .. 1.369 μs)
    std dev              68.90 ns   (53.99 ns .. 91.11 ns)
    variance introduced by outliers: 67% (severely inflated)

    benchmarking Small Input/Main.BinaryTreeWithSize
    time                 2.370 μs   (2.330 μs .. 2.427 μs)
                         0.996 R²   (0.993 R² .. 0.998 R²)
    mean                 2.377 μs   (2.345 μs .. 2.431 μs)
    std dev              136.0 ns   (97.18 ns .. 202.1 ns)
    variance introduced by outliers: 70% (severely inflated)

    benchmarking Small Input/Main.BufferBuilderMonoid
    time                 2.202 μs   (2.176 μs .. 2.249 μs)
                         0.999 R²   (0.997 R² .. 1.000 R²)
    mean                 2.208 μs   (2.190 μs .. 2.239 μs)
    std dev              75.29 ns   (32.46 ns .. 119.3 ns)
    variance introduced by outliers: 46% (moderately inflated)

    benchmarking Small Input/Main.DListWithSize
    time                 2.898 μs   (2.872 μs .. 2.926 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 2.895 μs   (2.877 μs .. 2.926 μs)
    std dev              78.72 ns   (61.71 ns .. 107.4 ns)
    variance introduced by outliers: 34% (moderately inflated)

    benchmarking Small Input/Main.DList
    time                 1.597 μs   (1.553 μs .. 1.656 μs)
                         0.993 R²   (0.989 R² .. 0.997 R²)
    mean                 1.606 μs   (1.566 μs .. 1.666 μs)
    std dev              146.4 ns   (100.3 ns .. 198.0 ns)
    variance introduced by outliers: 86% (severely inflated)

    benchmarking Small Input/Main.Seq
    time                 1.458 μs   (1.433 μs .. 1.490 μs)
                         0.996 R²   (0.992 R² .. 0.999 R²)
    mean                 1.455 μs   (1.437 μs .. 1.490 μs)
    std dev              85.24 ns   (51.88 ns .. 118.2 ns)
    variance introduced by outliers: 72% (severely inflated)

    benchmarking Small Input/Data.ByteString.Builder
    time                 1.560 μs   (1.552 μs .. 1.568 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 1.560 μs   (1.552 μs .. 1.577 μs)
    std dev              37.39 ns   (19.52 ns .. 67.87 ns)
    variance introduced by outliers: 30% (moderately inflated)

    benchmarking Small Input/Data.ByteString
    time                 1.162 μs   (1.156 μs .. 1.171 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 1.164 μs   (1.159 μs .. 1.172 μs)
    std dev              20.79 ns   (15.04 ns .. 32.94 ns)
    variance introduced by outliers: 19% (moderately inflated)

    benchmarking Small Input/Main.Concat
    time                 1.635 μs   (1.622 μs .. 1.649 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 1.664 μs   (1.644 μs .. 1.704 μs)
    std dev              90.42 ns   (59.72 ns .. 131.1 ns)
    variance introduced by outliers: 69% (severely inflated)

    benchmarking Small Input/List
    time                 1.310 μs   (1.274 μs .. 1.339 μs)
                         0.997 R²   (0.996 R² .. 0.998 R²)
    mean                 1.269 μs   (1.257 μs .. 1.300 μs)
    std dev              57.74 ns   (44.44 ns .. 75.89 ns)
    variance introduced by outliers: 61% (severely inflated)

    benchmarking Small Input/Main.ListT
    time                 2.563 μs   (2.534 μs .. 2.593 μs)
                         0.998 R²   (0.997 R² .. 0.999 R²)
    mean                 2.657 μs   (2.585 μs .. 2.739 μs)
    std dev              246.2 ns   (166.0 ns .. 311.6 ns)
    variance introduced by outliers: 86% (severely inflated)

    benchmarking Large Input/Main.BinaryTree, explicit allocation
    time                 1.508 ms   (1.501 ms .. 1.516 ms)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 1.509 ms   (1.502 ms .. 1.527 ms)
    std dev              31.90 μs   (13.31 μs .. 62.55 μs)
    variance introduced by outliers: 10% (moderately inflated)

    benchmarking Large Input/Main.BinaryTree, thru list
    time                 505.8 μs   (503.5 μs .. 508.7 μs)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 513.1 μs   (509.0 μs .. 519.2 μs)
    std dev              18.48 μs   (12.30 μs .. 26.77 μs)
    variance introduced by outliers: 28% (moderately inflated)

    benchmarking Large Input/Main.BinaryTreeWithSize
    time                 1.239 ms   (1.229 ms .. 1.248 ms)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 1.238 ms   (1.234 ms .. 1.245 ms)
    std dev              20.09 μs   (13.62 μs .. 31.48 μs)

    benchmarking Large Input/Main.BufferBuilderMonoid
    time                 227.1 μs   (226.5 μs .. 227.8 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 229.9 μs   (228.9 μs .. 231.2 μs)
    std dev              4.342 μs   (3.792 μs .. 5.259 μs)
    variance introduced by outliers: 11% (moderately inflated)

    benchmarking Large Input/Main.DListWithSize
    time                 2.592 ms   (2.581 ms .. 2.604 ms)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 2.590 ms   (2.582 ms .. 2.599 ms)
    std dev              28.84 μs   (23.90 μs .. 40.37 μs)

    benchmarking Large Input/Main.DList
    time                 781.8 μs   (776.2 μs .. 789.2 μs)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 779.0 μs   (774.5 μs .. 785.4 μs)
    std dev              17.82 μs   (11.85 μs .. 24.55 μs)
    variance introduced by outliers: 12% (moderately inflated)

    benchmarking Large Input/Main.Seq
    time                 817.9 μs   (803.9 μs .. 834.9 μs)
                         0.998 R²   (0.997 R² .. 1.000 R²)
    mean                 818.7 μs   (810.9 μs .. 833.6 μs)
    std dev              28.95 μs   (18.62 μs .. 42.11 μs)
    variance introduced by outliers: 25% (moderately inflated)

    benchmarking Large Input/Data.ByteString.Builder
    time                 388.4 μs   (380.5 μs .. 396.5 μs)
                         0.998 R²   (0.997 R² .. 1.000 R²)
    mean                 379.0 μs   (376.7 μs .. 383.2 μs)
    std dev              9.065 μs   (6.019 μs .. 16.27 μs)
    variance introduced by outliers: 16% (moderately inflated)

    benchmarking Large Input/Data.ByteString
    time                 2.488 ms   (2.358 ms .. 2.640 ms)
                         0.984 R²   (0.977 R² .. 0.993 R²)
    mean                 2.345 ms   (2.306 ms .. 2.402 ms)
    std dev              160.6 μs   (125.7 μs .. 232.0 μs)
    variance introduced by outliers: 48% (moderately inflated)

    benchmarking Large Input/Main.Concat
    time                 8.341 ms   (7.518 ms .. 9.279 ms)
                         0.934 R²   (0.899 R² .. 0.970 R²)
    mean                 8.462 ms   (8.098 ms .. 8.971 ms)
    std dev              1.352 ms   (1.051 ms .. 1.795 ms)
    variance introduced by outliers: 78% (severely inflated)

    benchmarking Large Input/List
    time                 49.91 ms   (47.35 ms .. 54.07 ms)
                         0.989 R²   (0.975 R² .. 0.997 R²)
    mean                 48.86 ms   (47.59 ms .. 50.29 ms)
    std dev              2.425 ms   (1.926 ms .. 3.135 ms)
    variance introduced by outliers: 14% (moderately inflated)

    benchmarking Large Input/Main.ListT
    time                 115.8 ms   (112.7 ms .. 119.5 ms)
                         0.998 R²   (0.993 R² .. 1.000 R²)
    mean                 117.8 ms   (115.0 ms .. 120.1 ms)
    std dev              3.723 ms   (2.628 ms .. 4.855 ms)
    variance introduced by outliers: 11% (moderately inflated)

