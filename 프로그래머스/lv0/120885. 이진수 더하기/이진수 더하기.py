def solution(bin1, bin2):
    int1 = int(bin1, 2)
    int2 = int(bin2, 2)
    return bin(int1+int2)[2:]