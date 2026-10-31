@echo off
chcp 65001 >nul
title Quan Ly Cloud Phone - Admin: cotex
color 0B

:MENU
cls
echo ========================================================
echo         HE THONG NHAN TAI KHOAN CLOUD PHONE TU DONG
echo ========================================================
echo.
echo [ dang tai du lieu tu may chu NoteVN... ]

:: Tao file tam de lay du lieu tu trang NoteVN
powershell -Command "$url='https://notevn.com/cloudphone'; try { $html = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content; $text = [System.Text.RegularExpressions.Regex]::Replace($html, '<[^>]+>', ''); if($text.Length -lt 50) { exit 1 } else { $text | Out-File -Encoding utf8 '%TEMP%\cloud_data.txt'; exit 0 } } catch { exit 1 }"

if errorlevel 1 goto HET_MAY

echo [Thanh cong] Da lay du lieu tai khoan moi nhat!
echo.
echo Vui long chon dich vu cloud phone ban muon su dung:
echo   [1] VMOS Trail
echo   [2] UGPhone Trail
echo   [3] VS Phone
echo   [4] QT Phone
echo   [5] Thoat chuong trinh
echo.

set /p choice="Nhap lua chon cua ban (1-4): "

if "%choice%"=="1" goto GUIDE_VMOS
if "%choice%"=="2" goto GUIDE_UGPHONE
if "%choice%"=="3" goto GUIDE_VS
if "%choice%"=="4" goto GUIDE_QT
if "%choice%"=="5" exit
goto MENU

:HET_MAY
cls
echo ========================================================
echo                   THONG BAO TU HE THONG
echo ========================================================
echo.
echo  [!] Hien tai da het may hoac admin chua cap nhat tai khoan!
echo  [!] Vui long doi admin them may len trang NoteVN nhe.
echo.
echo ========================================================
echo Truy cap trang nguon: https://notevn.com/cloudphone
echo.
pause
goto MENU

:GUIDE_VMOS
cls
echo ========================================================
echo                   HUONG DAN SU DUNG VMOS
echo ========================================================
echo 1. Tai ung dung VMOS ve thiet bi cua ban.
echo 2. Mo app va su dung thong tin tai khoan/mat khau 
echo    duoc cung cấp tu danh sach de dang nhap va trai nghiem.
echo.
echo Danh sach tai khoan hien tai tren he thong:
echo --------------------------------------------------------
type "%TEMP%\cloud_data.txt"
echo --------------------------------------------------------
echo.
pause
goto MENU

:GUIDE_UGPHONE
cls
echo ========================================================
echo                   HUONG DAN SU DUNG UGPHONE
echo ========================================================
echo 1. Mo trinh duyet, len Google va go tim kiem tu khoa:
echo    ==> controlkingdev
echo 2. Truy cap vao trang tuong ung de lay thong tin hoac 
echo    su dung tai khoan duoc cung cap de dang nhap.
echo.
echo Danh sach tai khoan hien tai tren he thong:
echo --------------------------------------------------------
type "%TEMP%\cloud_data.txt"
echo --------------------------------------------------------
echo.
pause
goto MENU

:GUIDE_VS
cls
echo ========================================================
echo                   HUONG DAN SU DUNG VS PHONE
echo ========================================================
echo 1. Tai ung dung VS Phone ve thiet bi cua ban.
echo 2. Mo app va dung tai khoan/mat khau da cho de dang nhap su dung.
echo.
echo Danh sach tai khoan hien tai tren he thong:
echo --------------------------------------------------------
type "%TEMP%\cloud_data.txt"
echo --------------------------------------------------------
echo.
pause
goto MENU

:GUIDE_QT
cls
echo ========================================================
echo                   HUONG DAN SU DUNG QT PHONE
echo ========================================================
echo 1. Tai ung dung QT Phone ve thiet bi cua ban.
echo 2. Mo app va dung tai khoan/mat khau da cho de dang nhap su dung.
echo.
echo Danh sach tai khoan hien tai tren he thong:
echo --------------------------------------------------------
type "%TEMP%\cloud_data.txt"
echo --------------------------------------------------------
echo.
pause
goto MENU