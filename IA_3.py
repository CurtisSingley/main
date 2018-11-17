A = [31,41,59,26,41,58]
for j in range(0,len(A)-1):
    t = len(A)-j-1
    key = A[t-1]
    i = t
    while i < len(A) and key > A[i]:
        A[i-1] = A[i]
        i += 1
    A[i-1] = key

print(A)
