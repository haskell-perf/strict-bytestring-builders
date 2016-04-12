# Summary

This project exists purely for research purposes of determining the optimal way of building strict bytestrings. The ideas behind this project stem from [a discussion on Reddit](https://www.reddit.com/r/haskell/comments/3qj53a/an_alternative_bytestring_builder/).

If you know any way of optimizing any particular benchmark or can suggest another benchmark subject, instead of complaining, PR without hesitation! This is intended to be a community project.

# Current results

There's no clear winner. Seems to depend on the use case. What's noticeable is that in all tests the standard builder is dominated by some other.

    benchmarking Small Input/ByteString.TreeBuilder
    time                 275.8 ns   (266.1 ns .. 285.9 ns)
                         0.991 R²   (0.986 R² .. 0.996 R²)
    mean                 278.7 ns   (270.3 ns .. 288.7 ns)
    std dev              24.94 ns   (17.36 ns .. 33.51 ns)
    variance introduced by outliers: 88% (severely inflated)

    benchmarking Small Input/Main.BufferBuilderMonoid
    time                 1.220 μs   (1.212 μs .. 1.229 μs)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 1.224 μs   (1.217 μs .. 1.232 μs)
    std dev              25.72 ns   (18.78 ns .. 35.17 ns)
    variance introduced by outliers: 25% (moderately inflated)

    benchmarking Small Input/Main.DListWithSize
    time                 341.1 ns   (331.7 ns .. 352.7 ns)
                         0.992 R²   (0.989 R² .. 0.995 R²)
    mean                 349.2 ns   (339.0 ns .. 362.3 ns)
    std dev              41.60 ns   (34.15 ns .. 52.56 ns)
    variance introduced by outliers: 93% (severely inflated)

    benchmarking Small Input/Main.DList
    time                 535.2 ns   (515.6 ns .. 558.8 ns)
                         0.992 R²   (0.988 R² .. 0.997 R²)
    mean                 543.6 ns   (529.5 ns .. 555.2 ns)
    std dev              41.50 ns   (36.01 ns .. 48.90 ns)
    variance introduced by outliers: 83% (severely inflated)

    benchmarking Small Input/Main.Seq
    time                 482.9 ns   (467.8 ns .. 508.4 ns)
                         0.989 R²   (0.983 R² .. 0.995 R²)
    mean                 500.0 ns   (488.9 ns .. 513.2 ns)
    std dev              40.95 ns   (34.14 ns .. 50.84 ns)
    variance introduced by outliers: 85% (severely inflated)

    benchmarking Small Input/Blaze.ByteString.Builder
    time                 998.1 ns   (967.1 ns .. 1.027 μs)
                         0.991 R²   (0.985 R² .. 0.996 R²)
    mean                 985.8 ns   (962.1 ns .. 1.027 μs)
    std dev              97.44 ns   (66.38 ns .. 138.6 ns)
    variance introduced by outliers: 89% (severely inflated)

    benchmarking Small Input/Data.ByteString.Builder
    time                 954.3 ns   (930.3 ns .. 991.6 ns)
                         0.990 R²   (0.985 R² .. 0.995 R²)
    mean                 992.0 ns   (960.9 ns .. 1.017 μs)
    std dev              102.9 ns   (85.10 ns .. 115.4 ns)
    variance introduced by outliers: 90% (severely inflated)

    benchmarking Small Input/Data.ByteString
    time                 311.4 ns   (301.0 ns .. 322.2 ns)
                         0.992 R²   (0.990 R² .. 0.995 R²)
    mean                 311.6 ns   (303.9 ns .. 321.7 ns)
    std dev              27.78 ns   (24.00 ns .. 33.44 ns)
    variance introduced by outliers: 88% (severely inflated)

    benchmarking Medium Input/ByteString.TreeBuilder
    time                 101.7 μs   (100.4 μs .. 102.8 μs)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 100.1 μs   (99.44 μs .. 100.9 μs)
    std dev              2.535 μs   (1.773 μs .. 3.730 μs)
    variance introduced by outliers: 22% (moderately inflated)

    benchmarking Medium Input/Main.BufferBuilderMonoid
    time                 198.1 μs   (196.1 μs .. 200.3 μs)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 198.9 μs   (197.5 μs .. 200.8 μs)
    std dev              5.402 μs   (3.845 μs .. 8.225 μs)
    variance introduced by outliers: 22% (moderately inflated)

    benchmarking Medium Input/Main.DListWithSize
    time                 231.1 μs   (225.2 μs .. 238.1 μs)
                         0.994 R²   (0.992 R² .. 0.996 R²)
    mean                 239.4 μs   (235.2 μs .. 243.8 μs)
    std dev              15.97 μs   (13.81 μs .. 18.50 μs)
    variance introduced by outliers: 62% (severely inflated)

    benchmarking Medium Input/Main.DList
    time                 488.2 μs   (479.7 μs .. 499.3 μs)
                         0.998 R²   (0.996 R² .. 0.999 R²)
    mean                 493.8 μs   (487.9 μs .. 512.4 μs)
    std dev              28.53 μs   (16.37 μs .. 53.98 μs)
    variance introduced by outliers: 51% (severely inflated)

    benchmarking Medium Input/Main.Seq
    time                 736.7 μs   (729.9 μs .. 745.1 μs)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 746.3 μs   (741.7 μs .. 752.5 μs)
    std dev              17.79 μs   (14.57 μs .. 23.54 μs)
    variance introduced by outliers: 14% (moderately inflated)

    benchmarking Medium Input/Blaze.ByteString.Builder
    time                 372.6 μs   (363.2 μs .. 381.4 μs)
                         0.996 R²   (0.995 R² .. 0.998 R²)
    mean                 371.5 μs   (363.9 μs .. 376.5 μs)
    std dev              18.35 μs   (14.10 μs .. 20.31 μs)
    variance introduced by outliers: 45% (moderately inflated)

    benchmarking Medium Input/Data.ByteString.Builder
    time                 367.4 μs   (361.6 μs .. 374.6 μs)
                         0.997 R²   (0.995 R² .. 0.999 R²)
    mean                 366.9 μs   (362.9 μs .. 373.2 μs)
    std dev              16.52 μs   (13.26 μs .. 19.30 μs)
    variance introduced by outliers: 40% (moderately inflated)

    benchmarking Medium Input/Data.ByteString
    time                 2.347 ms   (2.169 ms .. 2.550 ms)
                         0.953 R²   (0.930 R² .. 0.984 R²)
    mean                 2.412 ms   (2.319 ms .. 2.549 ms)
    std dev              390.4 μs   (309.0 μs .. 455.9 μs)
    variance introduced by outliers: 84% (severely inflated)

    benchmarking Large Input/ByteString.TreeBuilder
    time                 21.51 ms   (21.36 ms .. 21.69 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 21.86 ms   (21.73 ms .. 22.18 ms)
    std dev              449.2 μs   (244.4 μs .. 759.4 μs)

    benchmarking Large Input/Main.BufferBuilderMonoid
    time                 44.03 ms   (43.60 ms .. 44.51 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 44.29 ms   (43.70 ms .. 44.65 ms)
    std dev              849.4 μs   (492.8 μs .. 1.369 ms)

    benchmarking Large Input/Main.DListWithSize
    time                 79.10 ms   (78.12 ms .. 80.34 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 80.12 ms   (79.62 ms .. 80.74 ms)
    std dev              967.8 μs   (744.3 μs .. 1.286 ms)

    benchmarking Large Input/Main.DList
    time                 106.4 ms   (105.3 ms .. 108.3 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 108.5 ms   (107.9 ms .. 109.4 ms)
    std dev              1.119 ms   (770.9 μs .. 1.593 ms)

    benchmarking Large Input/Main.Seq
    time                 166.9 ms   (164.0 ms .. 169.3 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 169.8 ms   (168.9 ms .. 171.3 ms)
    std dev              1.635 ms   (305.9 μs .. 2.410 ms)
    variance introduced by outliers: 12% (moderately inflated)

    benchmarking Large Input/Blaze.ByteString.Builder
    time                 115.9 ms   (114.1 ms .. 119.0 ms)
                         0.999 R²   (0.999 R² .. 1.000 R²)
    mean                 114.8 ms   (113.2 ms .. 115.8 ms)
    std dev              1.725 ms   (998.8 μs .. 2.618 ms)
    variance introduced by outliers: 11% (moderately inflated)

    benchmarking Large Input/Data.ByteString.Builder
    time                 114.7 ms   (113.8 ms .. 116.6 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 114.9 ms   (114.4 ms .. 115.7 ms)
    std dev              879.9 μs   (602.8 μs .. 1.292 ms)
    variance introduced by outliers: 11% (moderately inflated)

    benchmarking Large Input/foldr/ByteString.TreeBuilder
    time                 39.13 ms   (38.76 ms .. 39.70 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 39.19 ms   (39.03 ms .. 39.39 ms)
    std dev              353.5 μs   (252.3 μs .. 466.8 μs)

    benchmarking Large Input/foldr/Main.BufferBuilderMonoid
    time                 21.09 ms   (20.82 ms .. 21.41 ms)
                         0.999 R²   (0.998 R² .. 0.999 R²)
    mean                 20.88 ms   (20.75 ms .. 21.03 ms)
    std dev              364.3 μs   (296.5 μs .. 446.2 μs)

    benchmarking Large Input/foldr/Main.DListWithSize
    time                 72.19 ms   (71.09 ms .. 73.31 ms)
                         1.000 R²   (0.999 R² .. 1.000 R²)
    mean                 72.98 ms   (72.58 ms .. 73.43 ms)
    std dev              709.1 μs   (513.2 μs .. 986.6 μs)

    benchmarking Large Input/foldr/Main.DList
    time                 70.91 ms   (69.27 ms .. 72.58 ms)
                         0.998 R²   (0.996 R² .. 1.000 R²)
    mean                 71.70 ms   (70.61 ms .. 73.23 ms)
    std dev              2.112 ms   (1.417 ms .. 3.470 ms)

    benchmarking Large Input/foldr/Main.Seq
    time                 198.6 ms   (191.6 ms .. 203.1 ms)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 201.7 ms   (198.9 ms .. 203.0 ms)
    std dev              2.349 ms   (707.1 μs .. 3.386 ms)
    variance introduced by outliers: 14% (moderately inflated)

    benchmarking Large Input/foldr/Blaze.ByteString.Builder
    time                 31.98 ms   (29.90 ms .. 33.69 ms)
                         0.987 R²   (0.973 R² .. 0.995 R²)
    mean                 33.63 ms   (32.78 ms .. 34.48 ms)
    std dev              1.873 ms   (1.340 ms .. 2.400 ms)
    variance introduced by outliers: 18% (moderately inflated)

    benchmarking Large Input/foldr/Data.ByteString.Builder
    time                 32.42 ms   (30.24 ms .. 34.18 ms)
                         0.987 R²   (0.975 R² .. 0.995 R²)
    mean                 34.18 ms   (33.13 ms .. 35.20 ms)
    std dev              2.089 ms   (1.558 ms .. 2.656 ms)
    variance introduced by outliers: 18% (moderately inflated)

    benchmarking Large Input/mconcat/ByteString.TreeBuilder
    time                 39.37 ms   (38.83 ms .. 39.96 ms)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 39.31 ms   (39.08 ms .. 39.69 ms)
    std dev              539.7 μs   (315.9 μs .. 833.8 μs)

    benchmarking Large Input/mconcat/Main.BufferBuilderMonoid
    time                 20.78 ms   (20.52 ms .. 21.11 ms)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 21.34 ms   (21.15 ms .. 21.63 ms)
    std dev              585.9 μs   (407.5 μs .. 864.3 μs)

    benchmarking Large Input/mconcat/Main.DListWithSize
    time                 71.94 ms   (71.57 ms .. 72.60 ms)
                         1.000 R²   (1.000 R² .. 1.000 R²)
    mean                 73.39 ms   (72.86 ms .. 74.63 ms)
    std dev              1.328 ms   (398.1 μs .. 2.081 ms)

    benchmarking Large Input/mconcat/Main.DList
    time                 69.39 ms   (68.17 ms .. 71.77 ms)
                         0.998 R²   (0.994 R² .. 1.000 R²)
    mean                 70.89 ms   (69.80 ms .. 72.08 ms)
    std dev              1.935 ms   (1.378 ms .. 2.438 ms)

    benchmarking Large Input/mconcat/Main.Seq
    time                 195.6 ms   (190.0 ms .. 202.6 ms)
                         0.999 R²   (0.998 R² .. 1.000 R²)
    mean                 197.0 ms   (195.0 ms .. 198.2 ms)
    std dev              1.913 ms   (819.5 μs .. 2.836 ms)
    variance introduced by outliers: 14% (moderately inflated)

    benchmarking Large Input/mconcat/Blaze.ByteString.Builder
    time                 33.34 ms   (31.73 ms .. 35.23 ms)
                         0.989 R²   (0.971 R² .. 0.997 R²)
    mean                 32.63 ms   (31.81 ms .. 33.65 ms)
    std dev              1.738 ms   (1.103 ms .. 2.536 ms)
    variance introduced by outliers: 18% (moderately inflated)

    benchmarking Large Input/mconcat/Data.ByteString.Builder
    time                 35.10 ms   (33.34 ms .. 36.35 ms)
                         0.993 R²   (0.987 R² .. 0.997 R²)
    mean                 32.73 ms   (31.97 ms .. 33.56 ms)
    std dev              1.635 ms   (1.269 ms .. 1.988 ms)
    variance introduced by outliers: 17% (moderately inflated)

