FROM bigdatafinalimage:v4
COPY number.txt /usr/local/bigdata/filename/
CMD python /usr/local/bigdata/code_files/compress.py

