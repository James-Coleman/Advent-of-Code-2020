//
//  Day 1 Part 2.swift
//  Advent of Code 2020
//
//  Created by James Coleman on 03/12/2020.
//

import Foundation

func intArray(from input: String) -> [Int] {
    return input.split(separator: "\n").compactMap { Int($0) }
}

func day1Part2() {
    
    let challengeInput = """
    1977
    1802
    1856
    1309
    2003
    1854
    1898
    1862
    1857
    542
    1616
    1599
    1628
    1511
    1848
    1623
    1959
    1693
    1444
    1211
    1551
    1399
    1855
    1538
    1869
    1664
    1719
    1241
    1875
    1733
    1547
    1813
    1531
    1773
    624
    1336
    1897
    1179
    1258
    1205
    1727
    1364
    1957
    540
    1970
    1273
    1621
    1964
    1723
    1699
    1847
    1249
    1254
    1644
    1449
    1794
    1797
    1713
    1534
    1202
    1951
    1598
    1926
    1865
    1294
    1893
    1641
    1325
    1432
    1960
    413
    1517
    1724
    1715
    1458
    1775
    1317
    1694
    1484
    1840
    1999
    1811
    1578
    1658
    1906
    1481
    1313
    1997
    1339
    1592
    1971
    1453
    1706
    1884
    1956
    1384
    1579
    1689
    1726
    1217
    1796
    1536
    1213
    1867
    1304
    2010
    1503
    1665
    1361
    814
    2007
    1430
    1625
    1958
    860
    1799
    1942
    1876
    1772
    1198
    1221
    1814
    1826
    1667
    1334
    1504
    1420
    1164
    1414
    1934
    1823
    1507
    1195
    21
    1752
    1472
    1196
    1558
    1322
    1927
    1556
    1922
    277
    1828
    1883
    1280
    1947
    1231
    1915
    1235
    1961
    1494
    1324
    2009
    1367
    1545
    1736
    1575
    1214
    1704
    1833
    1663
    1474
    1894
    1754
    1564
    1321
    1119
    1975
    1987
    1873
    1834
    1686
    1574
    1505
    1656
    1688
    1896
    1982
    1554
    1990
    1902
    1859
    1293
    1739
    1282
    1889
    1981
    1283
    1687
    1220
    1443
    1409
    1252
    1506
    1742
    1319
    1882
    951
    1849
    """

    let intChallengeInput = intArray(from: challengeInput)
    
    func threeSumTo2020(input: [Int]) -> (first: Int, second: Int, third: Int)? {
        for (firstIndex, firstInt) in input.enumerated() {
            for (secondIndex, secondInt) in input.enumerated() {
                guard secondIndex > firstIndex else { continue }
                
                for (thirdIndex, thirdInt) in input.enumerated() {
                    guard thirdIndex > secondIndex else { continue }
                    
//                    print("comparing \(firstInt) and \(secondInt) and \(thirdInt)")
                    
                    if firstInt + secondInt + thirdInt == 2020 {
                        return (firstInt, secondInt, thirdInt)
                    }
                }
            }
        }
        
        return nil
    }
    
    if let sum = threeSumTo2020(input: intChallengeInput) {
        let product = sum.first * sum.second * sum.third
        
        print(product)
    }
}
