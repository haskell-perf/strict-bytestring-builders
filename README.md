# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

    benchmarking Small Input/Main.BinaryTree, explicit allocation
    time                 385.1 ns   (384.4 ns .. 385.9 ns)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 385.3 ns   (384.7 ns .. 386.2 ns)
    std dev              2.471 ns   (1.650 ns .. 3.651 ns)

    benchmarking Small Input/Main.BinaryTree, thru list
    time                 472.2 ns   (465.3 ns .. 480.2 ns)
                         0.998 R²   (0.996 R² .. 1.000 R²)
    mean                 470.6 ns   (466.9 ns .. 477.0 ns)
    std dev              17.10 ns   (7.516 ns .. 26.99 ns)
    variance introduced by outliers: 53% (severely inflated)

    benchmarking Small Input/Main.BinaryTreeWithSize
    time                 355.4 ns   (354.7 ns .. 356.2 ns)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 355.9 ns   (354.7 ns .. 357.4 ns)
    std dev              4.739 ns   (2.803 ns .. 6.846 ns)
    variance introduced by outliers: 13% (moderately inflated)

    benchmarking Small Input/Main.BufferBuilderMonoid
    time                 1.166 μs   (1.162 μs .. 1.170 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 1.168 μs   (1.167 μs .. 1.169 μs)
    std dev              4.448 ns   (3.065 ns .. 6.863 ns)

    benchmarking Small Input/Main.DListWithSize
    time                 444.9 ns   (443.6 ns .. 447.0 ns)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 457.4 ns   (450.6 ns .. 466.1 ns)
    std dev              26.93 ns   (19.59 ns .. 34.01 ns)
    variance introduced by outliers: 75% (severely inflated)

    benchmarking Small Input/Main.DList
    time                 549.2 ns   (547.3 ns .. 552.5 ns)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 549.3 ns   (548.0 ns .. 552.0 ns)
    std dev              6.871 ns   (3.008 ns .. 11.80 ns)
    variance introduced by outliers: 11% (moderately inflated)

    benchmarking Small Input/Main.Seq
    time                 564.3 ns   (557.3 ns .. 575.1 ns)
                         0.998 R²   (0.995 R² .. 1.000 R²)
    mean                 561.7 ns   (557.3 ns .. 573.2 ns)
    std dev              22.16 ns   (10.56 ns .. 39.85 ns)
    variance introduced by outliers: 56% (severely inflated)

    benchmarking Small Input/Data.ByteString.Builder
    time                 1.212 μs   (1.181 μs .. 1.259 μs)
                         0.993 R²   (0.989 R² .. 0.996 R²)
    mean                 1.228 μs   (1.197 μs .. 1.259 μs)
    std dev              107.5 ns   (89.01 ns .. 131.7 ns)
    variance introduced by outliers: 86% (severely inflated)

    benchmarking Small Input/Data.ByteString
    time                 408.0 ns   (395.1 ns .. 420.5 ns)
                         0.995 R²   (0.993 R² .. 0.998 R²)
    mean                 394.4 ns   (389.2 ns .. 402.7 ns)
    std dev              21.40 ns   (14.09 ns .. 29.41 ns)
    variance introduced by outliers: 72% (severely inflated)

    benchmarking Small Input/Main.Concat
    time                 891.7 ns   (888.8 ns .. 895.4 ns)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 892.5 ns   (889.9 ns .. 897.3 ns)
    std dev              11.73 ns   (8.259 ns .. 17.31 ns)
    variance introduced by outliers: 12% (moderately inflated)

    benchmarking Small Input/List
    time                 451.5 ns   (450.2 ns .. 452.8 ns)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 451.2 ns   (450.3 ns .. 452.6 ns)
    std dev              3.840 ns   (3.027 ns .. 5.234 ns)

    benchmarking Small Input/Main.ListT
    time                 929.6 ns   (918.0 ns .. 946.4 ns)
                         0.998 R²   (0.996 R² .. 1.000 R²)
    mean                 928.0 ns   (919.3 ns .. 943.3 ns)
    std dev              37.83 ns   (18.57 ns .. 57.19 ns)
    variance introduced by outliers: 57% (severely inflated)

    benchmarking Large Input/Main.BinaryTree, explicit allocation
    time                 96.18 μs   (96.12 μs .. 96.24 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 96.21 μs   (96.15 μs .. 96.27 μs)
    std dev              220.1 ns   (174.8 ns .. 325.3 ns)

    benchmarking Large Input/Main.BinaryTree, thru list
    time                 425.5 μs   (423.0 μs .. 428.7 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 424.5 μs   (423.3 μs .. 426.0 μs)
    std dev              3.843 μs   (2.309 μs .. 5.383 μs)

    benchmarking Large Input/Main.BinaryTreeWithSize
    time                 99.63 μs   (99.54 μs .. 99.73 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 99.55 μs   (99.45 μs .. 99.64 μs)
    std dev              317.2 ns   (237.0 ns .. 451.6 ns)

    benchmarking Large Input/Main.BufferBuilderMonoid
    time                 192.2 μs   (192.1 μs .. 192.3 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 192.4 μs   (192.3 μs .. 192.5 μs)
    std dev              402.0 ns   (330.0 ns .. 506.9 ns)

    benchmarking Large Input/Main.DListWithSize
    time                 248.9 μs   (248.6 μs .. 249.2 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 249.0 μs   (248.8 μs .. 249.3 μs)
    std dev              808.4 ns   (617.7 ns .. 1.213 μs)

    benchmarking Large Input/Main.DList
    time                 448.0 μs   (447.4 μs .. 448.9 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 449.0 μs   (448.2 μs .. 450.7 μs)
    std dev              3.696 μs   (2.723 μs .. 5.718 μs)

    benchmarking Large Input/Main.Seq
    time                 707.9 μs   (702.5 μs .. 717.9 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 704.5 μs   (703.4 μs .. 706.5 μs)
    std dev              5.989 μs   (3.098 μs .. 9.415 μs)

    benchmarking Large Input/Data.ByteString.Builder
    time                 329.8 μs   (329.3 μs .. 330.4 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 330.1 μs   (329.4 μs .. 331.0 μs)
    std dev              2.749 μs   (1.685 μs .. 4.405 μs)

    benchmarking Large Input/Data.ByteString
    time                 2.727 ms   (2.703 ms .. 2.751 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 2.717 ms   (2.709 ms .. 2.733 ms)
    std dev              35.75 μs   (26.11 μs .. 58.92 μs)

    benchmarking Large Input/Main.Concat
    time                 7.357 ms   (7.326 ms .. 7.399 ms)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 7.314 ms   (7.294 ms .. 7.338 ms)
    std dev              68.38 μs   (53.43 μs .. 99.53 μs)

    benchmarking Large Input/List
    time                 50.24 ms   (50.03 ms .. 50.45 ms)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 49.89 ms   (49.57 ms .. 50.04 ms)
    std dev              430.6 μs   (139.3 μs .. 593.1 μs)

    benchmarking Large Input/Main.ListT
    time                 112.8 ms   (110.4 ms .. 118.1 ms)
                         0.998 R²   (0.989 R² .. 1.000 R²)
    mean                 112.6 ms   (111.4 ms .. 115.7 ms)
    std dev              2.536 ms   (288.9 μs .. 3.694 ms)
    variance introduced by outliers: 11% (moderately inflated)

