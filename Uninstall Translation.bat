del Cfg.ini
rm /s .\languages

cd .\"Backup Directory"

copy Cfg.ini ..
move en ..
move sc ..

cd ..

rm /s .\"Backup Directory"
