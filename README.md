# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

    benchmarking Small Input/Main.BufferBuilderMonoid
    time                 2.168 μs   (2.154 μs .. 2.187 μs)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 2.193 μs   (2.171 μs .. 2.230 μs)
    std dev              94.54 ns   (54.62 ns .. 138.5 ns)
    variance introduced by outliers: 57% (severely inflated)

    benchmarking Small Input/Main.Concat
    time                 1.631 μs   (1.589 μs .. 1.688 μs)
                         0.996 R²   (0.992 R² .. 1.000 R²)
    mean                 1.603 μs   (1.586 μs .. 1.632 μs)
    std dev              73.21 ns   (33.57 ns .. 111.2 ns)
    variance introduced by outliers: 61% (severely inflated)

    benchmarking Small Input/Main.Seq
    time                 1.390 μs   (1.377 μs .. 1.405 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 1.390 μs   (1.381 μs .. 1.408 μs)
    std dev              40.92 ns   (24.44 ns .. 69.99 ns)
    variance introduced by outliers: 39% (moderately inflated)

    benchmarking Small Input/Main.DList
    time                 1.517 μs   (1.499 μs .. 1.547 μs)
                         0.995 R²   (0.990 R² .. 0.999 R²)
    mean                 1.541 μs   (1.512 μs .. 1.600 μs)
    std dev              128.0 ns   (83.09 ns .. 192.7 ns)
    variance introduced by outliers: 84% (severely inflated)

    benchmarking Small Input/Main.BinaryTree, thru list
    time                 1.318 μs   (1.269 μs .. 1.372 μs)
                         0.994 R²   (0.991 R² .. 0.999 R²)
    mean                 1.286 μs   (1.268 μs .. 1.315 μs)
    std dev              77.96 ns   (49.28 ns .. 112.8 ns)
    variance introduced by outliers: 74% (severely inflated)

    benchmarking Small Input/Main.BinaryTree, explicit allocation
    time                 9.211 μs   (9.097 μs .. 9.374 μs)
                         0.997 R²   (0.994 R² .. 1.000 R²)
    mean                 9.209 μs   (9.124 μs .. 9.425 μs)
    std dev              430.4 ns   (241.5 ns .. 803.4 ns)
    variance introduced by outliers: 58% (severely inflated)

    benchmarking Small Input/Main.BinaryTreeWithSize
    time                 6.319 μs   (6.093 μs .. 6.544 μs)
                         0.996 R²   (0.993 R² .. 1.000 R²)
    mean                 6.128 μs   (6.083 μs .. 6.257 μs)
    std dev              232.4 ns   (116.5 ns .. 381.3 ns)
    variance introduced by outliers: 48% (moderately inflated)

    benchmarking Small Input/Data.ByteString.Builder
    time                 1.539 μs   (1.527 μs .. 1.554 μs)
                         0.997 R²   (0.994 R² .. 0.999 R²)
    mean                 1.604 μs   (1.558 μs .. 1.656 μs)
    std dev              154.7 ns   (107.0 ns .. 215.3 ns)
    variance introduced by outliers: 88% (severely inflated)

    benchmarking Small Input/Data.ByteString
    time                 1.149 μs   (1.142 μs .. 1.159 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 1.154 μs   (1.149 μs .. 1.162 μs)
    std dev              24.49 ns   (19.39 ns .. 32.18 ns)
    variance introduced by outliers: 25% (moderately inflated)

    benchmarking Large Input/Main.BufferBuilderMonoid
    time                 229.9 μs   (227.4 μs .. 232.6 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 230.3 μs   (228.8 μs .. 231.8 μs)
    std dev              4.755 μs   (3.928 μs .. 5.893 μs)
    variance introduced by outliers: 13% (moderately inflated)

    benchmarking Large Input/Main.Concat
    time                 7.659 ms   (7.472 ms .. 7.883 ms)
                         0.997 R²   (0.995 R² .. 0.999 R²)
    mean                 7.532 ms   (7.472 ms .. 7.617 ms)
    std dev              206.6 μs   (157.3 μs .. 260.2 μs)
    variance introduced by outliers: 11% (moderately inflated)

    benchmarking Large Input/Main.Seq
    time                 811.1 μs   (805.7 μs .. 817.2 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 810.4 μs   (807.3 μs .. 817.2 μs)
    std dev              15.18 μs   (7.489 μs .. 30.26 μs)

    benchmarking Large Input/Main.DList
    time                 783.6 μs   (777.6 μs .. 791.0 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 779.2 μs   (775.7 μs .. 784.2 μs)
    std dev              14.28 μs   (10.81 μs .. 19.49 μs)

    benchmarking Large Input/Main.BinaryTree, thru list
    time                 508.3 μs   (501.6 μs .. 514.6 μs)
                         0.998 R²   (0.997 R² .. 0.999 R²)
    mean                 507.3 μs   (503.6 μs .. 514.0 μs)
    std dev              16.90 μs   (11.99 μs .. 25.23 μs)
    variance introduced by outliers: 26% (moderately inflated)

    benchmarking Large Input/Main.BinaryTree, explicit allocation
    time                 32.13 ms   (31.74 ms .. 32.46 ms)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 32.30 ms   (32.08 ms .. 32.60 ms)
    std dev              536.9 μs   (353.1 μs .. 791.9 μs)

    benchmarking Large Input/Main.BinaryTreeWithSize
    time                 4.970 ms   (4.747 ms .. 5.219 ms)
                         0.986 R²   (0.979 R² .. 0.993 R²)
    mean                 5.009 ms   (4.921 ms .. 5.114 ms)
    std dev              300.7 μs   (244.7 μs .. 364.1 μs)
    variance introduced by outliers: 35% (moderately inflated)

    benchmarking Large Input/Data.ByteString.Builder
    time                 393.3 μs   (385.0 μs .. 408.0 μs)
                         0.995 R²   (0.993 R² .. 0.998 R²)
    mean                 403.9 μs   (396.7 μs .. 411.1 μs)
    std dev              23.49 μs   (21.52 μs .. 26.26 μs)
    variance introduced by outliers: 52% (severely inflated)

    benchmarking Large Input/Data.ByteString
    time                 2.221 ms   (2.181 ms .. 2.297 ms)
                         0.984 R²   (0.969 R² .. 0.994 R²)
    mean                 2.466 ms   (2.404 ms .. 2.558 ms)
    std dev              260.8 μs   (225.2 μs .. 338.8 μs)
    variance introduced by outliers: 69% (severely inflated)
