# 자바의 scanner처럼 실행 후 콘솔에서 숫자를 입력받아 
# 홀수 짝수를 판별하여 출력하는 코드를 작성하시오.

num = int(input())

if (num == 0):
    print("0입니다.")
elif (num % 2 ==0):
    print("짝수입니다.")
elif (num % 2 == 1):
    print("홀수입니다.")