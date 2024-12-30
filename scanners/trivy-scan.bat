@echo off
set IMAGE=%1
echo Scanning Docker image: %IMAGE%
trivy image %IMAGE%
