# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. As a result of this project some library may be released (depending on the outcome). The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

`ByteString.TreeBuilder` is the clear winner. With the standard and "blaze" builders being at least 4 times slower on all input sizes.

    benchmarking Small Input/ByteString.TreeBuilder
    time                 246.3 ns   (245.9 ns .. 246.8 ns)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 246.2 ns   (245.7 ns .. 246.8 ns)
    std dev              1.820 ns   (1.295 ns .. 2.648 ns)

    benchmarking Small Input/Main.BufferBuilderMonoid
    time                 1.190 μs   (1.188 μs .. 1.193 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 1.194 μs   (1.193 μs .. 1.196 μs)
    std dev              5.331 ns   (4.264 ns .. 6.613 ns)

    benchmarking Small Input/Main.DListWithSize
    time                 317.9 ns   (314.2 ns .. 324.3 ns)
                         0.997 R²   (0.993 R² .. 1.000 R²)
    mean                 320.6 ns   (316.6 ns .. 329.9 ns)
    std dev              19.11 ns   (11.58 ns .. 28.94 ns)
    variance introduced by outliers: 76% (severely inflated)

    benchmarking Small Input/Main.DList
    time                 506.4 ns   (503.8 ns .. 509.5 ns)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 504.2 ns   (502.3 ns .. 506.5 ns)
    std dev              6.717 ns   (5.523 ns .. 8.757 ns)
    variance introduced by outliers: 13% (moderately inflated)

    benchmarking Small Input/Main.Seq
    time                 462.1 ns   (445.8 ns .. 479.5 ns)
                         0.993 R²   (0.989 R² .. 0.998 R²)
    mean                 452.7 ns   (443.5 ns .. 464.1 ns)
    std dev              32.35 ns   (19.47 ns .. 41.83 ns)
    variance introduced by outliers: 81% (severely inflated)

    benchmarking Small Input/Blaze.ByteString.Builder
    time                 907.2 ns   (903.3 ns .. 913.3 ns)
                         0.998 R²   (0.997 R² .. 0.999 R²)
    mean                 946.4 ns   (924.9 ns .. 974.1 ns)
    std dev              82.87 ns   (57.21 ns .. 106.4 ns)
    variance introduced by outliers: 86% (severely inflated)

    benchmarking Small Input/Data.ByteString.Builder
    time                 907.4 ns   (905.0 ns .. 910.6 ns)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 907.7 ns   (905.5 ns .. 911.1 ns)
    std dev              9.069 ns   (6.812 ns .. 12.97 ns)

    benchmarking Small Input/Data.ByteString
    time                 283.9 ns   (282.7 ns .. 285.8 ns)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 284.2 ns   (283.3 ns .. 286.7 ns)
    std dev              4.749 ns   (2.022 ns .. 9.003 ns)
    variance introduced by outliers: 19% (moderately inflated)

    benchmarking Medium Input/ByteString.TreeBuilder
    time                 89.01 μs   (88.83 μs .. 89.19 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 89.02 μs   (88.88 μs .. 89.18 μs)
    std dev              496.9 ns   (416.6 ns .. 628.3 ns)

    benchmarking Medium Input/Main.BufferBuilderMonoid
    time                 199.3 μs   (198.3 μs .. 200.5 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 199.0 μs   (198.2 μs .. 199.9 μs)
    std dev              2.767 μs   (2.354 μs .. 3.574 μs)

    benchmarking Medium Input/Main.DListWithSize
    time                 213.3 μs   (211.1 μs .. 217.3 μs)
                         0.996 R²   (0.992 R² .. 0.999 R²)
    mean                 216.4 μs   (213.5 μs .. 220.7 μs)
    std dev              12.36 μs   (7.734 μs .. 16.59 μs)
    variance introduced by outliers: 55% (severely inflated)

    benchmarking Medium Input/Main.DList
    time                 487.5 μs   (486.3 μs .. 488.7 μs)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 488.5 μs   (487.6 μs .. 489.6 μs)
    std dev              3.251 μs   (2.642 μs .. 4.093 μs)

    benchmarking Medium Input/Main.Seq
    time                 708.3 μs   (701.5 μs .. 718.0 μs)
                         0.998 R²   (0.997 R² .. 1.000 R²)
    mean                 716.3 μs   (708.8 μs .. 725.9 μs)
    std dev              30.78 μs   (21.69 μs .. 38.88 μs)
    variance introduced by outliers: 35% (moderately inflated)

    benchmarking Medium Input/Blaze.ByteString.Builder
    time                 362.0 μs   (359.1 μs .. 367.1 μs)
                         0.998 R²   (0.997 R² .. 1.000 R²)
    mean                 363.5 μs   (361.1 μs .. 367.4 μs)
    std dev              11.13 μs   (7.231 μs .. 16.41 μs)
    variance introduced by outliers: 24% (moderately inflated)

    benchmarking Medium Input/Data.ByteString.Builder
    time                 369.7 μs   (362.5 μs .. 377.2 μs)
                         0.997 R²   (0.995 R² .. 0.999 R²)
    mean                 375.1 μs   (369.9 μs .. 382.8 μs)
    std dev              19.79 μs   (16.84 μs .. 22.34 μs)
    variance introduced by outliers: 48% (moderately inflated)

    benchmarking Medium Input/Data.ByteString
    time                 2.164 ms   (2.154 ms .. 2.173 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 2.164 ms   (2.155 ms .. 2.176 ms)
    std dev              33.16 μs   (25.29 μs .. 45.23 μs)

    benchmarking Large Input/ByteString.TreeBuilder
    time                 21.04 ms   (20.84 ms .. 21.23 ms)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 21.25 ms   (21.08 ms .. 21.52 ms)
    std dev              518.4 μs   (265.1 μs .. 897.1 μs)

    benchmarking Large Input/Main.BufferBuilderMonoid
    time                 44.05 ms   (43.23 ms .. 45.13 ms)
                         0.999 R²   (0.997 R² .. 1.000 R²)
    mean                 44.26 ms   (43.97 ms .. 44.59 ms)
    std dev              674.0 μs   (525.9 μs .. 942.3 μs)

    benchmarking Large Input/Main.DListWithSize
    time                 89.62 ms   (88.34 ms .. 91.35 ms)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 90.52 ms   (89.63 ms .. 91.28 ms)
    std dev              1.350 ms   (990.7 μs .. 1.789 ms)

    benchmarking Large Input/Main.DList
    time                 110.2 ms   (107.2 ms .. 114.9 ms)
                         0.998 R²   (0.994 R² .. 1.000 R²)
    mean                 109.7 ms   (108.1 ms .. 111.3 ms)
    std dev              2.341 ms   (1.202 ms .. 3.324 ms)
    variance introduced by outliers: 11% (moderately inflated)

    benchmarking Large Input/Main.Seq
    time                 178.1 ms   (164.7 ms .. 191.1 ms)
                         0.994 R²   (0.980 R² .. 1.000 R²)
    mean                 175.9 ms   (170.3 ms .. 183.2 ms)
    std dev              7.247 ms   (4.811 ms .. 9.299 ms)
    variance introduced by outliers: 14% (moderately inflated)

    benchmarking Large Input/Blaze.ByteString.Builder
    time                 124.6 ms   (119.2 ms .. 130.7 ms)
                         0.997 R²   (0.992 R² .. 1.000 R²)
    mean                 126.1 ms   (123.8 ms .. 128.0 ms)
    std dev              2.915 ms   (2.060 ms .. 4.029 ms)
    variance introduced by outliers: 11% (moderately inflated)

    benchmarking Large Input/Data.ByteString.Builder
    time                 122.0 ms   (105.6 ms .. 142.2 ms)
                         0.984 R²   (0.946 R² .. 0.999 R²)
    mean                 128.1 ms   (123.6 ms .. 138.2 ms)
    std dev              9.119 ms   (4.847 ms .. 13.69 ms)
    variance introduced by outliers: 23% (moderately inflated)

    benchmarking Large Input/Data.ByteString
    time                 13.99 s    (13.28 s .. NaN s)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 14.06 s    (13.93 s .. 14.12 s)
    std dev              117.7 ms   (0.0 s .. 124.7 ms)
    variance introduced by outliers: 19% (moderately inflated)
