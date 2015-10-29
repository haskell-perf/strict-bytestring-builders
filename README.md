# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

    benchmarking Main.BinaryTree, thru list
    time                 1.332 μs   (1.317 μs .. 1.350 μs)
                         0.999 R²   (0.998 R² .. 0.999 R²)
    mean                 1.341 μs   (1.327 μs .. 1.362 μs)
    std dev              54.75 ns   (36.47 ns .. 89.02 ns)
    variance introduced by outliers: 56% (severely inflated)

    benchmarking Main.BinaryTree, explicit allocation
    time                 9.009 μs   (8.940 μs .. 9.099 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 8.971 μs   (8.939 μs .. 9.033 μs)
    std dev              153.0 ns   (118.0 ns .. 206.0 ns)
    variance introduced by outliers: 15% (moderately inflated)

    benchmarking Main.BinaryTreeWithSize
    time                 6.167 μs   (6.016 μs .. 6.367 μs)
                         0.995 R²   (0.991 R² .. 1.000 R²)
    mean                 6.093 μs   (6.034 μs .. 6.235 μs)
    std dev              297.8 ns   (142.9 ns .. 473.3 ns)
    variance introduced by outliers: 61% (severely inflated)

    benchmarking Data.ByteString.Builder
    time                 1.563 μs   (1.549 μs .. 1.580 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 1.560 μs   (1.551 μs .. 1.572 μs)
    std dev              33.13 ns   (22.65 ns .. 44.15 ns)
    variance introduced by outliers: 25% (moderately inflated)

    benchmarking Data.ByteString
    time                 1.229 μs   (1.186 μs .. 1.284 μs)
                         0.992 R²   (0.989 R² .. 0.998 R²)
    mean                 1.234 μs   (1.208 μs .. 1.289 μs)
    std dev              113.4 ns   (91.28 ns .. 167.2 ns)
    variance introduced by outliers: 87% (severely inflated)
