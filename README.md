# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

So far, `Main.BinaryTree` beats the competition.

    benchmarking Data.ByteString
    time                 1.219 μs   (1.182 μs .. 1.269 μs)
                         0.993 R²   (0.990 R² .. 0.997 R²)
    mean                 1.211 μs   (1.184 μs .. 1.242 μs)
    std dev              94.00 ns   (70.11 ns .. 113.4 ns)
    variance introduced by outliers: 83% (severely inflated)

    benchmarking Data.ByteString.Builder
    time                 918.3 ns   (874.3 ns .. 948.8 ns)
                         0.991 R²   (0.987 R² .. 0.996 R²)
    mean                 857.5 ns   (842.1 ns .. 877.2 ns)
    std dev              63.70 ns   (46.89 ns .. 84.86 ns)
    variance introduced by outliers: 82% (severely inflated)

    benchmarking Main.BinaryTree
    time                 323.5 ns   (320.7 ns .. 326.5 ns)
                         0.998 R²   (0.997 R² .. 0.999 R²)
    mean                 337.4 ns   (331.6 ns .. 345.5 ns)
    std dev              25.90 ns   (21.89 ns .. 30.58 ns)
    variance introduced by outliers: 84% (severely inflated)

    benchmarking Main.BinaryTreeWithSize
    time                 4.601 μs   (4.568 μs .. 4.647 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 4.607 μs   (4.586 μs .. 4.650 μs)
    std dev              96.12 ns   (47.59 ns .. 164.6 ns)
    variance introduced by outliers: 22% (moderately inflated)
