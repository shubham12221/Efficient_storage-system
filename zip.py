import os
import zipfile
def gzip():
	os.chdir('/myAllProjects/new_bigdata/uploaded/')
	with zipfile.ZipFile("/myAllProjects/new_bigdata/selective.zip","w") as myzip:
		lst=os.listdir()
		for f in range(len(lst)):
			myzip.write(lst[f])

