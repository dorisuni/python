# 실행하면 콘솔에서 1또는 2를 입력받고, 1은 세로형구구단, 2는 가로형구구단을 각각 출력한다.
#구구단은 각각 함수로 정의하도록 한다.

def width():
    for i in range(2, 10):    
        for j in range(1, 10):
            print(i, "x", j, "=", i*j)
            
def length():
    for i in range(1, 10):  
        print(i, "단")
        for j in range(1, 10):
            print(i, "x", j, "=", i*j, end="  ")
        print()
        
        
num = int(input("1은 가로형 구구단, 2는 세로형 구구단이 출력됩니다. 1~2중 숫자를 입력해 보세요."))

if num == 1:
    width()
elif num == 2:
    length()