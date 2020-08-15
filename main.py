import os
import subprocess
#import magic
from zip import gzip
from unzip import gunzip
import urllib.request
import pandas as pd
from app import app
from flask import Flask, flash, request, redirect, render_template,send_file
from werkzeug.utils import secure_filename

ALLOWED_EXTENSIONS = set(['csv'])

def allowed_file(filename):
	return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/')
def index():
	return render_template('index.html')

@app.route('/compress')
def compression_upload_form():
	return render_template('upload_for_compression.html')

@app.route('/decompress')
def decompression_upload_form():
	return render_template('upload_for_decompression.html')

@app.route('/decompression',methods=['POST'])
def decompression():
	
	######## zip file uploaded to /myAllProjects/new_bigdata/ folder
	file = request.files['file']
	filename = secure_filename(file.filename)
	file.save('/myAllProjects/new_bigdata/'+filename)
	
	####### extracting files from zip file to /myAllProjects/new_bigdata/extract folder
	gunzip()
	
	###### list of extracted files 
	extract=os.listdir('/myAllProjects/new_bigdata/extracted/')
	
	##### iterate on each file and run docker contianer
	count=0
	for filename in extract:
		
		### filename which is to be decompress is written inside number.txt
		#open(folder+str(count)+filename, 'w+').writelines(write_file)
		file=open('/myAllProjects/new_bigdata/number.txt','w+')
		file.write(filename)
		file.close()
		
		check=subprocess.getoutput('docker ps -a | grep container{}'.format(count))
		if(check!=''):
			os.system('docker rm -f container{}'.format(count))	
		os.system('docker build -t "dockerfile" /myAllProjects/new_bigdata/')
		os.system('docker run -it -v /myAllProjects/new_bigdata/extracted/:/usr/local/bigdata/compressed -v /myAllProjects/new_bigdata/decompressed/:/usr/local/bigdata/decompressed/ --rm --name container{} dockerfile python /usr/local/bigdata/code_files/decompress.py'.format(count))
		count+=1
	
	actual_name=extract[0].split('compress')[-1]
	actual_name=actual_name.split(".")[0]
	os.system('cat /myAllProjects/new_bigdata/decompressed/*.csv >> /myAllProjects/new_bigdata/{}'.format(actual_name))
	os.system('rm -f /myAllProjects/new_bigdata/*.zip')
	os.system('rm -f /myAllProjects/new_bigdata/*.csv')
	os.system('rm -f /myAllProjects/new_bigdata/decompressed/*.csv')
	return send_file('/myAllProjects/new_bigdata/{}'.format(actual_name),attachment_filename=actual_name)

@app.route('/compression', methods=['POST'])
def compression():
	if request.method == 'POST':
	
        # check if the post request has the file part
		if 'file' not in request.files:
			flash('No file part')
			return redirect(request.url)

		#### check for file name validation
		file = request.files['file']
		if file.filename == '':
			flash('No file selected for uploading')
			return redirect(request.url)

		### validation on file extention
		if file and allowed_file(file.filename):

			##### clean up the environment
			os.system('rm -f /myAllProjects/new_bigdata/extracted/*')
			os.system('rm -f /myAllProjects/new_bigdata/file_chunk/*')
			os.system('rm -f /myAllProjects/new_bigdata/uploaded/*')
			os.system('rm -f /myAllProjects/new_bigdata/decompressed/*')
			os.system('rm -f /myAllProjects/new_bigdata/selective.zip')
			filename = secure_filename(file.filename)
			file.save('/myAllProjects/new_bigdata/'+filename)
			
			df=pd.read_csv('/myAllProjects/new_bigdata/'+filename)
			df1=df.drop_duplicates(subset=None, inplace=False)
			df1.to_csv('/myAllProjects/new_bigdata/'+filename)
			csvfilename = open('/myAllProjects/new_bigdata/'+filename, 'r').readlines()
			filesize=60000
			#header = csvfilename[0]
			csvfilename.pop(0) 
			count=0
			l=[]
			for i in range(len(csvfilename)):

				if i % filesize == 0:
					
					### folder name
					folder=app.config['UPLOAD_FOLDER']
					
					### file chunk created
					write_file = csvfilename[i:i+filesize]
					#if(i==0):
					#	write_file.insert(0,header)

					### filename which is to be compress is written inside number.txt
					open(folder+str(count)+filename, 'w+').writelines(write_file)
					file=open('/myAllProjects/new_bigdata/number.txt','w+')
					file.write(str(count)+filename)
					file.close()
					
					### dockerfile created and run in background
					check=subprocess.getoutput('docker ps -a | grep container{}'.format(count))
					if(check!=''):
						os.system('docker rm -f container{}'.format(count))
					os.system('docker build -t "dockerfile" /myAllProjects/new_bigdata/')
					os.system('docker run -dit -v /myAllProjects/new_bigdata/file_chunk/:/usr/local/bigdata/file -v /myAllProjects/new_bigdata/uploaded/:/usr/local/bigdata/compressed/ --name container{} dockerfile'.format(count))

					count += 1
			while True:
				#### check for existence of docker container
				output=subprocess.getoutput('docker ps | wc -l')
				if(output=='2'):
					for i in range(count):
						ps=subprocess.getoutput('docker ps | grep container{}'.format(i))
						psa=subprocess.getoutput('docker ps -a| grep container{}'.format(i))
						if(ps=='' and psa!=''):
							os.system('docker rm -f container{}'.format(str(i)))
					gzip()
					return send_file('/myAllProjects/new_bigdata/selective.zip',attachment_filename='selective.zip')	
		
			flash('File successfully uploaded')
			return redirect('/')
		else:
			flash('Allowed file types are txt, pdf, png, jpg, jpeg, gif')
			return redirect(request.url)

if __name__ == "__main__":
    app.run()
