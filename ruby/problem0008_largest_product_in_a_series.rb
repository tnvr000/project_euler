# frozen_string_literal: true

# The four adjacent digits in the 1000-digit number that have the
# greatest product are 9 × 9 × 8 × 9 = 5832.

# 73167176531330624919225119674426574742355349194934
# 96983520312774506326239578318016984801869478851843
# 85861560789112949495459501737958331952853208805511
# 12540698747158523863050715693290963295227443043557
# 66896648950445244523161731856403098711121722383113
# 62229893423380308135336276614282806444486645238749
# 30358907296290491560440772390713810515859307960866
# 70172427121883998797908792274921901699720888093776
# 65727333001053367881220235421809751254540594752243
# 52584907711670556013604839586446706324415722155397
# 53697817977846174064955149290862569321978468622482
# 83972241375657056057490261407972968652414535100474
# 82166370484403199890008895243450658541227588666881
# 16427171479924442928230863465674813919123162824586
# 17866458359124566529476545682848912883142607690042
# 24219022671055626321111109370544217506941658960408
# 07198403850962455444362981230987879927244284909188
# 84580156166097919133875499200524063689912560717606
# 05886116467109405077541002256983155200055935729725
# 71636269561882670428252483600823257530420752963450

# Find the thirteen adjacent digits in the 1000-digit number that have
# the greatest product. What is the value of this product?

require('benchmark')

def largest_product(digit_count)
  number = 7_316_717_653_133_062_491_922_511_967_442_657_474_235_534_919_493_496_983_520_312_774_506_326_239_578_318_016_984_801_869_478_851_843_858_615_607_891_129_494_954_595_017_379_583_319_528_532_088_055_111_254_069_874_715_852_386_305_071_569_329_096_329_522_744_304_355_766_896_648_950_445_244_523_161_731_856_403_098_711_121_722_383_113_622_298_934_233_803_081_353_362_766_142_828_064_444_866_452_387_493_035_890_729_629_049_156_044_077_239_071_381_051_585_930_796_086_670_172_427_121_883_998_797_908_792_274_921_901_699_720_888_093_776_657_273_330_010_533_678_812_202_354_218_097_512_545_405_947_522_435_258_490_771_167_055_601_360_483_958_644_670_632_441_572_215_539_753_697_817_977_846_174_064_955_149_290_862_569_321_978_468_622_482_839_722_413_756_570_560_574_902_614_079_729_686_524_145_351_004_748_216_637_048_440_319_989_000_889_524_345_065_854_122_758_866_688_116_427_171_479_924_442_928_230_863_465_674_813_919_123_162_824_586_178_664_583_591_245_665_294_765_456_828_489_128_831_426_076_900_422_421_902_267_105_562_632_111_110_937_054_421_750_694_165_896_040_807_198_403_850_962_455_444_362_981_230_987_879_927_244_284_909_188_845_801_561_660_979_191_338_754_992_005_240_636_899_125_607_176_060_588_611_646_710_940_507_754_100_225_698_315_520_005_593_572_972_571_636_269_561_882_670_428_252_483_600_823_257_530_420_752_963_450
  number = number.to_s.chars.map(&:to_i)

  largest_product = 0
  0.upto(number.length - digit_count - 1) do |index|
    product = number[index..(index + digit_count - 1)].inject(:*)
    largest_product = product if product > largest_product
  end
  largest_product
end

Benchmark.bmbm do |x|
  x.report('largest product') { largest_product 13 }
end

puts largest_product 13