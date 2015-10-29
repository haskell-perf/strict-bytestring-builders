# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

    benchmarking Main.Concat
    time                 1.660 μs   (1.608 μs .. 1.745 μs)
                         0.991 R²   (0.988 R² .. 0.995 R²)
    mean                 1.753 μs   (1.715 μs .. 1.783 μs)
    std dev              119.9 ns   (104.9 ns .. 141.1 ns)
    variance introduced by outliers: 78% (severely inflated)

    benchmarking Main.DList, thru list
    time                 1.581 μs   (1.526 μs .. 1.637 μs)
                         0.993 R²   (0.991 R² .. 0.997 R²)
    mean                 1.549 μs   (1.521 μs .. 1.582 μs)
    std dev              109.6 ns   (88.57 ns .. 132.5 ns)
    variance introduced by outliers: 79% (severely inflated)

    benchmarking Main.BinaryTree, thru list
    time                 1.455 μs   (1.404 μs .. 1.507 μs)
                         0.993 R²   (0.991 R² .. 0.996 R²)
    mean                 1.402 μs   (1.363 μs .. 1.442 μs)
    std dev              115.7 ns   (105.0 ns .. 133.5 ns)
    variance introduced by outliers: 84% (severely inflated)

    benchmarking Main.BinaryTree, explicit allocation
    time                 9.013 μs   (8.946 μs .. 9.092 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 8.963 μs   (8.923 μs .. 9.021 μs)
    std dev              161.6 ns   (122.7 ns .. 233.0 ns)
    variance introduced by outliers: 17% (moderately inflated)

    benchmarking Main.BinaryTreeWithSize
    time                 6.029 μs   (6.010 μs .. 6.055 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 6.036 μs   (6.015 μs .. 6.073 μs)
    std dev              84.94 ns   (52.93 ns .. 135.3 ns)
    variance introduced by outliers: 11% (moderately inflated)

    benchmarking Data.ByteString.Builder
    time                 1.836 μs   (1.812 μs .. 1.863 μs)
                         0.997 R²   (0.994 R² .. 0.998 R²)
    mean                 1.750 μs   (1.686 μs .. 1.799 μs)
    std dev              168.6 ns   (144.4 ns .. 210.3 ns)
    variance introduced by outliers: 88% (severely inflated)

    benchmarking Data.ByteString
    time                 1.153 μs   (1.146 μs .. 1.161 μs)
                         0.999 R²   (0.998 R² .. 0.999 R²)
    mean                 1.189 μs   (1.167 μs .. 1.221 μs)
    std dev              88.87 ns   (58.10 ns .. 115.4 ns)
    variance introduced by outliers: 81% (severely inflated)
