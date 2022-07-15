import csv
import sys

if (len(sys.argv) != 3):
    print("Usage: python3 script.py \"file containing the init refs\" \"file containing the retailer extract\"")
    exit()

file1 = csv.reader(open(sys.argv[1], 'r'))
file2 = csv.reader(open(sys.argv[2], 'r'))
next(file2);

EAN_list = []
for row in file2:

    temp = [None] * 3
    if (len(row[0].split(";")) >= 15):
        temp[0] = row[0].split(";")[15]

    if (len(row[0].split(";")) > 17):
        temp[2] = row[0].split(";")[17]

    if (len(row[0].split(";")) >= 22):
        temp[1] = row[0].split(";")[22]

    if (temp[0] != None):
        EAN_list.append(temp)



reference_id_list = []
for row in file1:
    reference_id_list.append(row[0].split(";")[1])


res = 0
res_list = []
for ean in EAN_list:
    if ean[0] not in reference_id_list:
        res += 1
        if ean[1] == None:
            res_list.append(ean[0])

print("Number of untracked references: ", res)
print("Number of relevant untracked references: ", len(res_list))
print("List of relevant untracked items: ")

for elm in EAN_list:
    if (elm[0] != ""):
        print("EAN:", elm[0], "; Reference name:", elm[2])



