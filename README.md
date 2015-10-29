# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

    benchmarking Main.BufferBuilderMonoid
    time                 2.262 μs   (2.214 μs .. 2.310 μs)
                         0.997 R²   (0.996 R² .. 0.999 R²)
    mean                 2.259 μs   (2.224 μs .. 2.296 μs)
    std dev              123.1 ns   (99.36 ns .. 142.4 ns)
    variance introduced by outliers: 68% (severely inflated)

    benchmarking Main.Concat
    time                 1.682 μs   (1.634 μs .. 1.745 μs)
                         0.993 R²   (0.988 R² .. 0.997 R²)
    mean                 1.678 μs   (1.642 μs .. 1.720 μs)
    std dev              142.4 ns   (98.49 ns .. 180.3 ns)
    variance introduced by outliers: 85% (severely inflated)

    benchmarking Main.DList, thru list
    time                 1.649 μs   (1.591 μs .. 1.720 μs)
                         0.994 R²   (0.989 R² .. 0.999 R²)
    mean                 1.603 μs   (1.587 μs .. 1.643 μs)
    std dev              74.35 ns   (42.88 ns .. 129.7 ns)
    variance introduced by outliers: 62% (severely inflated)

    benchmarking Main.BinaryTree, thru list
    time                 1.337 μs   (1.327 μs .. 1.347 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 1.341 μs   (1.332 μs .. 1.360 μs)
    std dev              44.52 ns   (24.50 ns .. 70.03 ns)
    variance introduced by outliers: 45% (moderately inflated)

    benchmarking Main.BinaryTree, explicit allocation
    time                 9.150 μs   (9.067 μs .. 9.254 μs)
                         0.998 R²   (0.997 R² .. 0.999 R²)
    mean                 9.329 μs   (9.208 μs .. 9.533 μs)
    std dev              488.7 ns   (363.3 ns .. 653.6 ns)
    variance introduced by outliers: 63% (severely inflated)

    benchmarking Main.BinaryTreeWithSize
    time                 5.996 μs   (5.968 μs .. 6.026 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 5.987 μs   (5.972 μs .. 6.009 μs)
    std dev              65.18 ns   (51.05 ns .. 86.91 ns)

    benchmarking Data.ByteString.Builder
    time                 1.612 μs   (1.554 μs .. 1.677 μs)
                         0.995 R²   (0.992 R² .. 1.000 R²)
    mean                 1.567 μs   (1.555 μs .. 1.596 μs)
    std dev              61.38 ns   (33.52 ns .. 105.5 ns)
    variance introduced by outliers: 53% (severely inflated)

    benchmarking Data.ByteString
    time                 1.208 μs   (1.167 μs .. 1.259 μs)
                         0.993 R²   (0.987 R² .. 0.999 R²)
    mean                 1.182 μs   (1.168 μs .. 1.207 μs)
    std dev              63.81 ns   (33.30 ns .. 109.7 ns)
    variance introduced by outliers: 69% (severely inflated)
