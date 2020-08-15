import zipfile
def gunzip():
	with zipfile.ZipFile("/myAllProjects/new_bigdata/selective.zip","r") as zip_ref:
		zip_ref.extractall("/myAllProjects/new_bigdata/extracted/")
