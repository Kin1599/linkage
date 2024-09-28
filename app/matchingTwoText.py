
def preprocess(text: str) -> str:
    pun_list = [".",";",":","!","?","/","\\",",","#","@","$","&",")","(","'","\""]
    res = ''
    for i in text:
        if i not in pun_list:
            res += i
        else:
            res += ' '
    return res.lower()


def matching(t1: str, t2: str) -> float:
    res = 0.0
    return res

def main():
    text1 = input()
    text2 = input()
    text1_preprocess = preprocess(text1)
    text2_preprocess = preprocess(text2)
    print(text1_preprocess)

if __name__ == "__main__":
    main()