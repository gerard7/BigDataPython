import copy

l1 = [2,6,8]
l2 =[[1,5],[5,8,9,7],[8,9,6]]


l3 = copy.deepcopy(l2)
print("l3=",l3)
l3.append(l1)
print("l2=",l2)
print("l3=",l3)

l4 = l1.copy()
l4.append((-99))
print("l4=",l4)
print("l1=",l1)
