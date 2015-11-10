# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

`BinaryTreeWithSize` is the winner on all input sizes. With the standard and "blaze" builders being at least 4 times slower.

    benchmarking Small Input/Main.BinaryTree, explicit allocation
    time                 269.9 ns   (267.4 ns .. 273.9 ns)
                         0.998 R²   (0.997 R² .. 0.999 R²)
    mean                 272.3 ns   (269.8 ns .. 277.1 ns)
    std dev              11.33 ns   (7.976 ns .. 14.69 ns)
    variance introduced by outliers: 60% (severely inflated)

    benchmarking Small Input/Main.BinaryTree, thru list
    time                 393.7 ns   (379.5 ns .. 408.7 ns)
                         0.991 R²   (0.989 R² .. 0.995 R²)
    mean                 395.8 ns   (386.4 ns .. 406.1 ns)
    std dev              32.83 ns   (28.37 ns .. 37.03 ns)
    variance introduced by outliers: 86% (severely inflated)

    benchmarking Small Input/Main.BinaryTreeWithSize
    time                 260.9 ns   (250.3 ns .. 274.5 ns)
                         0.990 R²   (0.981 R² .. 1.000 R²)
    mean                 254.1 ns   (250.6 ns .. 263.1 ns)
    std dev              16.68 ns   (7.690 ns .. 29.93 ns)
    variance introduced by outliers: 79% (severely inflated)

    benchmarking Small Input/Main.BufferBuilderMonoid
    time                 1.208 μs   (1.195 μs .. 1.221 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 1.212 μs   (1.206 μs .. 1.215 μs)
    std dev              13.02 ns   (7.003 ns .. 20.20 ns)

    benchmarking Small Input/Main.DListWithSize
    time                 318.9 ns   (314.5 ns .. 325.7 ns)
                         0.996 R²   (0.993 R² .. 1.000 R²)
    mean                 319.5 ns   (315.0 ns .. 328.5 ns)
    std dev              18.71 ns   (7.872 ns .. 29.38 ns)
    variance introduced by outliers: 75% (severely inflated)

    benchmarking Small Input/Main.DList
    time                 484.0 ns   (470.1 ns .. 500.8 ns)
                         0.995 R²   (0.990 R² .. 1.000 R²)
    mean                 474.0 ns   (469.1 ns .. 485.1 ns)
    std dev              24.29 ns   (14.89 ns .. 40.36 ns)
    variance introduced by outliers: 69% (severely inflated)

    benchmarking Small Input/Main.Seq
    time                 448.6 ns   (440.9 ns .. 460.3 ns)
                         0.995 R²   (0.992 R² .. 0.997 R²)
    mean                 474.1 ns   (465.8 ns .. 489.4 ns)
    std dev              38.52 ns   (27.76 ns .. 55.96 ns)
    variance introduced by outliers: 85% (severely inflated)

    benchmarking Small Input/Blaze.ByteString.Builder
    time                 923.1 ns   (896.9 ns .. 952.0 ns)
                         0.994 R²   (0.990 R² .. 0.999 R²)
    mean                 929.9 ns   (909.9 ns .. 965.5 ns)
    std dev              88.09 ns   (62.70 ns .. 128.7 ns)
    variance introduced by outliers: 88% (severely inflated)

    benchmarking Small Input/Data.ByteString.Builder
    time                 989.2 ns   (962.5 ns .. 1.021 μs)
                         0.993 R²   (0.990 R² .. 0.997 R²)
    mean                 994.1 ns   (974.9 ns .. 1.022 μs)
    std dev              81.83 ns   (66.86 ns .. 98.23 ns)
    variance introduced by outliers: 85% (severely inflated)

    benchmarking Small Input/Data.ByteString
    time                 282.2 ns   (278.6 ns .. 287.5 ns)
                         0.996 R²   (0.993 R² .. 0.999 R²)
    mean                 293.6 ns   (287.7 ns .. 305.0 ns)
    std dev              25.43 ns   (20.37 ns .. 30.77 ns)
    variance introduced by outliers: 87% (severely inflated)

    benchmarking Medium Input/Main.BinaryTree, explicit allocation
    time                 171.6 μs   (170.0 μs .. 173.7 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 170.2 μs   (169.6 μs .. 171.1 μs)
    std dev              2.384 μs   (1.509 μs .. 3.294 μs)

    benchmarking Medium Input/Main.BinaryTree, thru list
    time                 439.0 μs   (437.8 μs .. 440.2 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 438.9 μs   (438.1 μs .. 439.9 μs)
    std dev              2.873 μs   (2.139 μs .. 4.169 μs)

    benchmarking Medium Input/Main.BinaryTreeWithSize
    time                 94.80 μs   (93.89 μs .. 96.05 μs)
                         0.999 R²   (0.997 R² .. 1.000 R²)
    mean                 94.67 μs   (94.00 μs .. 95.67 μs)
    std dev              2.801 μs   (1.610 μs .. 3.861 μs)
    variance introduced by outliers: 28% (moderately inflated)

    benchmarking Medium Input/Main.BufferBuilderMonoid
    time                 199.9 μs   (198.0 μs .. 201.8 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 198.0 μs   (196.8 μs .. 199.4 μs)
    std dev              3.758 μs   (2.998 μs .. 5.467 μs)
    variance introduced by outliers: 12% (moderately inflated)

    benchmarking Medium Input/Main.DListWithSize
    time                 206.2 μs   (205.4 μs .. 206.9 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 206.2 μs   (206.0 μs .. 206.5 μs)
    std dev              993.9 ns   (768.1 ns .. 1.276 μs)

    benchmarking Medium Input/Main.DList
    time                 481.7 μs   (480.8 μs .. 482.5 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 482.0 μs   (481.0 μs .. 482.8 μs)
    std dev              2.831 μs   (2.285 μs .. 3.672 μs)

    benchmarking Medium Input/Main.Seq
    time                 711.1 μs   (702.5 μs .. 721.1 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 709.1 μs   (707.1 μs .. 712.5 μs)
    std dev              8.932 μs   (6.284 μs .. 15.01 μs)

    benchmarking Medium Input/Blaze.ByteString.Builder
    time                 361.3 μs   (358.1 μs .. 364.6 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 357.9 μs   (357.0 μs .. 359.3 μs)
    std dev              3.851 μs   (2.823 μs .. 5.536 μs)

    benchmarking Medium Input/Data.ByteString.Builder
    time                 355.7 μs   (354.5 μs .. 357.0 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 359.4 μs   (357.7 μs .. 364.3 μs)
    std dev              10.20 μs   (6.953 μs .. 17.58 μs)
    variance introduced by outliers: 21% (moderately inflated)

    benchmarking Medium Input/Data.ByteString
    time                 2.286 ms   (2.218 ms .. 2.376 ms)
                         0.989 R²   (0.981 R² .. 0.997 R²)
    mean                 2.242 ms   (2.213 ms .. 2.293 ms)
    std dev              123.1 μs   (78.48 μs .. 179.6 μs)
    variance introduced by outliers: 38% (moderately inflated)

    benchmarking Large Input/Main.BinaryTree, explicit allocation
    time                 29.92 ms   (29.30 ms .. 30.40 ms)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 30.23 ms   (30.10 ms .. 30.47 ms)
    std dev              376.5 μs   (206.4 μs .. 610.2 μs)

    benchmarking Large Input/Main.BinaryTree, thru list
    time                 97.03 ms   (93.81 ms .. 101.3 ms)
                         0.997 R²   (0.993 R² .. 0.999 R²)
    mean                 97.42 ms   (94.66 ms .. 99.62 ms)
    std dev              3.943 ms   (2.090 ms .. 5.617 ms)

    benchmarking Large Input/Main.BinaryTreeWithSize
    time                 20.99 ms   (20.79 ms .. 21.18 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 21.09 ms   (21.02 ms .. 21.18 ms)
    std dev              175.5 μs   (127.2 μs .. 261.1 μs)

    benchmarking Large Input/Main.BufferBuilderMonoid
    time                 43.23 ms   (42.80 ms .. 43.73 ms)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 43.09 ms   (42.76 ms .. 43.52 ms)
    std dev              726.4 μs   (520.8 μs .. 1.087 ms)

    benchmarking Large Input/Main.DListWithSize
    time                 89.65 ms   (87.41 ms .. 94.71 ms)
                         0.996 R²   (0.988 R² .. 1.000 R²)
    mean                 89.09 ms   (87.94 ms .. 91.51 ms)
    std dev              2.516 ms   (654.2 μs .. 4.433 ms)

    benchmarking Large Input/Main.DList
    time                 106.6 ms   (105.2 ms .. 107.9 ms)
                         1.000 R²   (0.998 R² .. 1.000 R²)
    mean                 108.1 ms   (107.2 ms .. 109.3 ms)
    std dev              1.675 ms   (1.178 ms .. 2.273 ms)

    benchmarking Large Input/Main.Seq
    time                 178.6 ms   (170.9 ms .. 195.6 ms)
                         0.995 R²   (0.989 R² .. 1.000 R²)
    mean                 175.4 ms   (171.9 ms .. 181.3 ms)
    std dev              6.040 ms   (3.019 ms .. 8.736 ms)
    variance introduced by outliers: 12% (moderately inflated)

    benchmarking Large Input/Blaze.ByteString.Builder
    time                 115.8 ms   (114.1 ms .. 118.5 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 115.5 ms   (114.6 ms .. 116.3 ms)
    std dev              1.211 ms   (983.4 μs .. 1.472 ms)
    variance introduced by outliers: 11% (moderately inflated)

    benchmarking Large Input/Data.ByteString.Builder
    time                 119.5 ms   (116.8 ms .. 126.2 ms)
                         0.996 R²   (0.988 R² .. 1.000 R²)
    mean                 116.4 ms   (114.7 ms .. 121.5 ms)
    std dev              3.785 ms   (1.225 ms .. 5.842 ms)
    variance introduced by outliers: 11% (moderately inflated)

    benchmarking Large Input/Data.ByteString
    time                 15.13 s    (14.93 s .. NaN s)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 14.69 s    (14.53 s .. 14.82 s)
    std dev              184.5 ms   (0.0 s .. 210.4 ms)
    variance introduced by outliers: 19% (moderately inflated)

