# escape=`

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
ARG BUILD_NAME="vb6-in-docker"
ARG KEY
ARG STF
ARG COMPANY_NAME
ARG USER_NAME

ARG REPO=mcr.microsoft.com/windows/servercore
FROM $REPO:ltsc2016-amd64

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ENV NO_PROXY=cat.com HTTP_PROXY=http://proxy.cat.com:80 HTTPS_PROXY=http://proxy.cat.com:80

LABEL maintainer="Lincoln Zocateli <lzocateli00@outlook.com>" `
    org.label-schema.description="Visual Basic 6 in Docker" `
    org.label-schema.name=${BUILD_NAME} `
    org.label-schema.url="https://github.com/lzocateli00" `
    org.label-schema.vcs-ref=${VCS_REF} `
    org.label-schema.vcs-url="https://github.com/lzocateli00/vb6-in-docker" `
    org.label-schema.usage="https://github.com/lzocateli00/vb6-in-docker/blob/main/README.md" `
    org.label-schema.vendor="Lincoln Zocateli" `
    org.label-schema.version=${VERSION} `
    org.label-schema.schema-version="1.0.0" `
    org.label-schema.build-date=${BUILD_DATE} 


COPY vb6midia c:/vb6midia/

#COPY vb6midia/vb6cd1/Setup vb6midia/

COPY ${STF:-vb6ent.stf} c:/vb6midia/vb6cd1/setup/acmsetup.stf

RUN Start-Process powershell -Verb runAs; `
    Start-Process -FilePath "REGEDIT.exe /S c:/vb6midia/vb6cd1/key.dat"; `
    Start-Process -FilePath "c:/vb6midia/vb6cd1/setup/acmsetup.exe /T acmsetup.stf /S 'c:/vb6midia/vb6cd1' /n ${USER_NAME} /o ${COMPANY_NAME} /k ${KEY} /b 1 /gc $TEMP/vb6_install_log.txt /qtn" -Wait


# REM Set the Installation source folder variable
# SET INSTDIR=\\UNC Path to Installation folder on network
# REM Run the registry patch which allows us to skip the first GUI section of the install
# REGEDIT /S "%INSTDIR%\key.dat"
# REM Run the VB Installer itself with the serial number
# START /WAIT %INSTDIR%\setup\acmsetup.exe /T VB98Ent.stf /S "%INSTDIR%\" /n"User Name" /o "Company name" /k 1234567890
# /b 1 /gc %TEMP%\vb6_install_log.txt /qtn
# It is then necessary to reboot before applying the appropriate Service Pack.