def solution(s):
    answer = ''
    s = list(s)
    if len(s) % 2 == 1:
        answer += s[len(s)//2]
    else:
        answer += s[len(s)//2-1]
        answer += s[len(s)//2]
    return answer