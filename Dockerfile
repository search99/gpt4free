FROM python:3.10

RUN sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/http:\/\/security.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
    
RUN apt-get update \
 && apt-get install -y --no-install-recommends ffmpeg \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp

RUN pip config set global.index-url https://pypi.douban.com/simple

RUN pip install --upgrade pip \
 && pip install -r /tmp/requirements.txt \
 && rm /tmp/requirements.txt

COPY . /root/gpt4free

WORKDIR /root/gpt4free

CMD ["streamlit", "run", "./gui/streamlit_app.py"]

EXPOSE 8501
