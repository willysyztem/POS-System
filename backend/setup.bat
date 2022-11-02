@echo off

echo RUNNING FASTAPI BACKEND

set dir_venv="venv"

IF exist %dir_venv% (
    echo ... A VIRTUAL ENVIRONMENT ALREADY EXISTS
) ELSE (
    echo BUILDING VIRTUAL ENVIRONMENT
    CALL python3 -m venv %dir_venv%
)

echo ACTIVATING VIRTUAL ENVIRONMENT
CALL venv\Scripts\activate.bat

echo ... UPGRADE PIP
python -m pip install -–upgrade pip

echo INSTALLING DEPENDENCIES
pip3 install -r requirements.txt

echo RUNNING SERVER
uvicorn main:app --reload ssl_keyfile="./key.pem" ssl_certfile="./cert.pem"