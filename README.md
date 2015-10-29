# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

    benchmarking Main.DList, thru list
    time                 1.592 μs   (1.546 μs .. 1.648 μs)
                         0.993 R²   (0.990 R² .. 0.996 R²)
    mean                 1.613 μs   (1.580 μs .. 1.662 μs)
    std dev              133.7 ns   (117.3 ns .. 151.8 ns)
    variance introduced by outliers: 84% (severely inflated)

    benchmarking Main.BinaryTree, thru list
    time                 1.382 μs   (1.334 μs .. 1.437 μs)
                         0.993 R²   (0.990 R² .. 0.998 R²)
    mean                 1.340 μs   (1.320 μs .. 1.386 μs)
    std dev              88.63 ns   (63.55 ns .. 125.8 ns)
    variance introduced by outliers: 77% (severely inflated)

    benchmarking Main.BinaryTree, explicit allocation
    time                 9.430 μs   (9.246 μs .. 9.657 μs)
                         0.995 R²   (0.992 R² .. 0.997 R²)
    mean                 9.947 μs   (9.712 μs .. 10.22 μs)
    std dev              856.0 ns   (745.3 ns .. 962.5 ns)
    variance introduced by outliers: 82% (severely inflated)

    benchmarking Main.BinaryTreeWithSize
    time                 6.596 μs   (6.360 μs .. 6.874 μs)
                         0.989 R²   (0.983 R² .. 0.994 R²)
    mean                 6.595 μs   (6.432 μs .. 6.794 μs)
    std dev              621.3 ns   (507.9 ns .. 815.6 ns)
    variance introduced by outliers: 85% (severely inflated)

    benchmarking Data.ByteString.Builder
    time                 1.591 μs   (1.565 μs .. 1.626 μs)
                         0.995 R²   (0.992 R² .. 0.997 R²)
    mean                 1.637 μs   (1.602 μs .. 1.681 μs)
    std dev              140.5 ns   (115.5 ns .. 162.2 ns)
    variance introduced by outliers: 85% (severely inflated)

    benchmarking Data.ByteString
    time                 1.265 μs   (1.225 μs .. 1.310 μs)
                         0.993 R²   (0.991 R² .. 0.996 R²)
    mean                 1.230 μs   (1.207 μs .. 1.264 μs)
    std dev              97.30 ns   (82.04 ns .. 119.2 ns)
    variance introduced by outliers: 83% (severely inflated)
