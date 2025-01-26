#SingleInstance, Force
#UseHook
#NoEnv
SetWorkingDir %A_ScriptDir%
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#Persistent


SplashTextoff
ListLines Off
Process, Priority, , A
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
reloadStatus = 0
DayANS = 0
WeekANS = 0
FormatTime, CurrentDate,, ddMM

Usefull = Полезное
Cheatsheet = Меню памятки

IfnotExist, %A_ScriptDir%\res
{
FileCreateDir, %A_ScriptDir%\res
}
IfnotExist, %A_ScriptDir%\res\maj.png
{
URLDownloadToFile,https://jeazz.ucoz.net/ahk/admins/maj.png,%A_ScriptDir%\res\maj.png
}
IfNotExist, %A_ScriptDir%\res\bongo.cat
{
URLDownloadToFile, https://i.ibb.co/N3hjJMj/bongo.png,%A_ScriptDir%\res\bongo.png
}

FileSetAttrib, +H, %A_ScriptDir%\res

Menu, Tray, add, Показать, Show,
Menu, Tray, Default, Показать,
Menu, Tray, add, Перезагрузить, Reload,
Menu, Tray, add, Скрыть, Hide,
Menu, Tray, add, Закрыть, Close,
Menu, Tray, NoStandard

IniRead, Week, %A_ScriptDir%\res\Settings.ini, ANS, Week
IniRead, CurrentDateT, %A_ScriptDir%\res\Settings.ini, ANS, CurrentDateT
if CurrentDateT=%CurrentDate%
{
IniRead, CurrentDateT, %A_ScriptDir%\res\Settings.ini, ANS, CurrentDateT
IniRead, DayANS, %A_ScriptDir%\res\Settings.ini, ANS, DayANS
}
else
{
    IniWrite, %CurrentDate%, %A_ScriptDir%\res\Settings.ini, ANS, CurrentDateT
    IniWrite, %DayANS%, %A_ScriptDir%\res\Settings.ini, ANS, DayANS
    IniRead, DayANS, %A_ScriptDir%\res\Settings.ini, ANS, DayANS
    IniRead, CurrentDateT, %A_ScriptDir%\res\Settings.ini, ANS, CurrentDateT
}
if Week=%A_YWeek%
{
IniRead, Week, %A_ScriptDir%\res\Settings.ini, ANS, Week
IniRead, WeekANS, %A_ScriptDir%\res\Settings.ini, ANS, WeekANS
}
else
{
    IniWrite, %A_YWeek%, %A_ScriptDir%\res\Settings.ini, ANS, Week
    IniWrite, %WeekANS%, %A_ScriptDir%\res\Settings.ini, ANS, WeekANS
    IniRead, WeekANS, %A_ScriptDir%\res\Settings.ini, ANS, WeekANS
    IniRead, Week, %A_ScriptDir%\res\Settings.ini, ANS, Week
}

IniRead, Radio1, %A_ScriptDir%\res\Settings.ini, Resolution, 1920x1080
IniRead, Radio2, %A_ScriptDir%\res\Settings.ini, Resolution, 1600x900
IniRead, Radio3, %A_ScriptDir%\res\Settings.ini, Resolution, 1680x1050
IniRead, Radio4, %A_ScriptDir%\res\Settings.ini, Resolution, 1366x768
IniRead, Radio5, %A_ScriptDir%\res\Settings.ini, Resolution, 1280x960
IniRead, Radio6, %A_ScriptDir%\res\Settings.ini, Resolution, 1920x10802
IniRead, Radio7, %A_ScriptDir%\res\Settings.ini, Resolution, 1280х1024

IniRead, Radio8, %A_ScriptDir%\res\Settings.ini, Login Commands, /settimelocal 18 00 00
IniRead, Radio9, %A_ScriptDir%\res\Settings.ini, Login Commands, /gm
IniRead, Radio10, %A_ScriptDir%\res\Settings.ini, Login Commands, /dl
IniRead, Radio11, %A_ScriptDir%\res\Settings.ini, Login Commands, /esp3
IniRead, Radio12, %A_ScriptDir%\res\Settings.ini, Login Commands, /templeader
IniRead, Radio13, %A_ScriptDir%\res\Settings.ini, Login Commands, /chide
IniRead, Radio14, %A_ScriptDir%\res\Settings.ini, Login Commands, /zzdebug
IniRead, Radio15, %A_ScriptDir%\res\Settings.ini, Login Commands, /setweatherlocal extrasunny
IniRead, Radio16, %A_ScriptDir%\res\Settings.ini, Login Commands, /togglesnow 0
IniRead, Radio17, %A_ScriptDir%\res\Settings.ini, Login Commands, Ваш ID

IniRead, key1, %A_ScriptDir%\res\Settings.ini, Binds, KEY1
IniRead, key2, %A_ScriptDir%\res\Settings.ini, Binds, KEY2
IniRead, key3, %A_ScriptDir%\res\Settings.ini, Binds, KEY3
IniRead, key4, %A_ScriptDir%\res\Settings.ini, Binds, KEY4
IniRead, key4, %A_ScriptDir%\res\Settings.ini, Binds, KEY5

IniRead, dis, %A_ScriptDir%\res\Settings.ini, Discord, dis
IniRead, tag, %A_ScriptDir%\res\Settings.ini, Discord, tag
IniRead, gadis, %A_ScriptDir%\res\Settings.ini, Discord, gadis
IniRead, gatag, %A_ScriptDir%\res\Settings.ini, Discord, gatag
IniRead, zgadis, %A_ScriptDir%\res\Settings.ini, Discord, zgadis
IniRead, zgatag, %A_ScriptDir%\res\Settings.ini, Discord, zgatag

if dis=ERROR
{
IniWrite, .jeazz, %A_ScriptDir%\res\Settings.ini, Discord, dis
IniWrite, 5533, %A_ScriptDir%\res\Settings.ini, Discord, tag
IniWrite, TiGeR, %A_ScriptDir%\res\Settings.ini, Discord, gadis
IniWrite, 7777, %A_ScriptDir%\res\Settings.ini, Discord, gatag
IniWrite, yerka, %A_ScriptDir%\res\Settings.ini, Discord, zgadis
IniWrite, 0023, %A_ScriptDir%\res\Settings.ini, Discord, zgatag
}

IniRead, X, %A_ScriptDir%\res\Settings.ini, Coords, X
IniRead, Y, %A_ScriptDir%\res\Settings.ini, Coords, Y
IniRead, X2, %A_ScriptDir%\res\Settings.ini, Coords, X2
IniRead, Y2, %A_ScriptDir%\res\Settings.ini, Coords, Y2
IniRead, Fraction, %A_ScriptDir%\res\Settings.ini, Fraction, Fraction
IniRead, Dimension, %A_ScriptDir%\res\Settings.ini, Dimension, Dimension

if X=ERROR
{
IniWrite, 0, %A_ScriptDir%\res\Settings.ini, Coords, X
IniWrite, 0, %A_ScriptDir%\res\Settings.ini, Coords, Y
IniWrite, 0, %A_ScriptDir%\res\Settings.ini, Coords, X2
IniWrite, 0, %A_ScriptDir%\res\Settings.ini, Coords, Y2
IniWrite, 222, %A_ScriptDir%\res\Settings.ini, Dimension, Dimension
IniWrite, 7, %A_ScriptDir%\res\Settings.ini, Fraction, Fraction
reload
}

;гуи счетчика
WinSet_Click_Through(I, T="254") {
IfWinExist, % "ahk_id " I
{
If (T == "Off")
{
WinSet, AlwaysOnTop, Off, % "ahk_id " I
WinSet, Transparent, Off, % "ahk_id " I
WinSet, ExStyle, -0x20, % "ahk_id " I
}
Else
{
WinSet, AlwaysOnTop, On, % "ahk_id " I
If(T < 0 || T > 254 || T == "On")
T := 254
WinSet, Transparent, % T, % "ahk_id " I
WinSet, ExStyle, +0x20, % "ahk_id " I
}
}
Else
Return 0
}
Gui, +LastFound +ToolWindow
ID := WinExist()
Gui, Show, NoActivate, Hide x0 y0 w0 h0, Overlay
WinSet_Click_Through(ID, "On")
GuiControl,, Un-Clickable
CustomColor := "#00FF00"
Gui, +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, cRed
Gui, Font,, Proxima Nova
Gui, Font, s10
Gui, Font, q1
Gui, Font, w400
Gui, Add, Text, x9 vMyText cWhite, XXX, YYYY
Gui, Add, Text, x107 y7 vMyTotalR cWhite, XXXXXX, YYYYYY
Gui, Color, 1c2126
WinSet, TransColor, AAAAAA 170
GoSub, UpdateCounter1
Gui, Show, x%X% y%Y% w212 h30, Overlay

Hotkey, %KEY1%, Off, UseErrorLevel
Hotkey, %KEY1%, mtp, On, UseErrorLevel
Hotkey, %KEY2%, Off, UseErrorLevel
Hotkey, %KEY2%, vhod, On, UseErrorLevel
Hotkey, %KEY3%, Off, UseErrorLevel
Hotkey, %KEY3%, repm, On, UseErrorLevel
Hotkey, %KEY4%, Off, UseErrorLevel
Hotkey, %KEY4%, rep, On, UseErrorLevel
Hotkey, %KEY5%, Off, UseErrorLevel
Hotkey, %KEY5%, mclcommand, On, UseErrorLevel


;Общая инфа
Gui, Main: Add, Tab, x0 y0 w732 h400 , Хоткеи|Настройки
Gui, Main: -MaximizeBox
Gui, Main: -SysMenu
Gui, Main: Show, w732 h400, Admin.ahk customed by itserbaa
Gui, Main: Add, Button, x675 y2 w25 h16 ghide, —
Gui, Main: Add, Button, x705 y2 w25 h16 gClose, X
Gui, Main: Color, 1e2124
Gui, Main: Font,cwhite, Proxima Nova
Gui, Main: Add, Picture, x500 y50 w200 h200, %A_ScriptDir%\res\bongo.png

;Левый блок кнопок
Gui, Main: Add, Button, x10 y26 w64 h21 gInfo , Ифно
Gui, Main: Add, Button, x10 y52 w64 h21 gOpenSite , Одежда
Gui, Main: Add, Button, x10 y78 w64 h21 gOpenAnotherSite , Гайд
Gui, Main: Add, Button, x10 y104 w64 h21 gSaveData, Сохранить

;Верхние боксы
Gui, Main: Add, GroupBox, x90 y18 w160 h27 cA52A2A,
Gui, Main: Add, GroupBox, x270 y18 w168 h27 cA52A2A,
Gui, Main: Add, Text, x150 y28 w50 h14 +0x200, Бинды
Gui, Main: Add, Text, x305 y28 w100 h14 +0x200 , Команды при входе

;MCL commands
Gui, Main: Add, Hotkey, x90 y50 w48 h21 vHot1, %KEY1% ; specoff + f5
Gui, Main: Add, Hotkey, x90 y76 w48 h21 vHot2, %KEY2% ; Команды при входе
Gui, Main: Add, Hotkey, x90 y102 w48 h21 vHot3, %KEY3% ; -реп
Gui, Main: Add, Hotkey, x90 y128 w48 h21 vHot4, %KEY4% ; +1 репорт
Gui, Main: Add, Hotkey, x90 y157 w48 h21 vHot5, %KEY5% ; mclcommand

Gui, Main: Add, Text, x143 y53 w120 h14 +0x200, specoff + f5
Gui, Main: Add, Text, x143 y79 w120 h14 +0x200, Команды при входе
Gui, Main: Add, Text, x143 y105 w120 h14 +0x200, Убрать -1 репорт
Gui, Main: Add, Text, x143 y131 w120 h14 +0x200, Добавить +1 репорт
Gui, Main: Add, Text, x143 y157 w120 h14 +0x200, MCL команды

;при входе
Gui, Main: Add, CheckBox, x280 y50 w120 h23 vRadio8 Checked%Radio8%, /settimelocal 18 00 00
Gui, Main: Add, CheckBox, x280 y76 w120 h23 vRadio9 Checked%Radio9%, /gm
Gui, Main: Add, CheckBox, x280 y102 w120 h23 vRadio10 Checked%Radio10%, /dl
Gui, Main: Add, CheckBox, x280 y128 w120 h23 vRadio11 Checked%Radio11%, /esp3
Gui, Main: Add, CheckBox, x280 y154 w120 h23 vRadio12 Checked%Radio12%, /templeader %Fraction%
Gui, Main: Add, CheckBox, x280 y180 w120 h23 vRadio13 Checked%Radio13%, /chide
Gui, Main: Add, CheckBox, x280 y206 w120 h23 vRadio14 Checked%Radio14%, /zzdebug
Gui, Main: Add, CheckBox, x280 y232 w120 h23 vRadio15 Checked%Radio15%, /setweatherlocal extrasunny
Gui, Main: Add, CheckBox, x280 y258 w120 h23 vRadio16 Checked%Radio16%, /togglesnow 0
Gui, Main: Add, CheckBox, x280 y284 w120 h23 vRadio17 Checked%Radio17%, Ваш ID

;настройки 
Gui, Main: Tab, 2
Gui, Main: Add, Button, x675 y2 w25 h16 ghide, —
Gui, Main: Add, Button, x705 y2 w25 h16 gClose, X
Gui, Main: Add, Picture, x149 y240, %A_ScriptDir%\res\maj.png
Gui, Main: Add, GroupBox, x10 y18 w710 h27 cA52A2A,
Gui, Main: Add, GroupBox, x10 y150 w168 h27 cA52A2A,
Gui, Main: Add, Text, x44 y28 w120 h14 +0x200 , Разрешение экрана
Gui, Main: Add, Radio, x12 y50 w80 h23 Group vRadio1 Checked%Radio1%, 1920x1080
Gui, Main: Add, Radio, x12 y128 w80 h23 vRadio2 Checked%Radio2%, 1600x900
Gui, Main: Add, Radio, x12 y102 w80 h23 vRadio3 Checked%Radio3%, 1680x1050
Gui, Main: Add, Radio, x114 y102 w80 h23 vRadio4 Checked%Radio4%, 1366x768
Gui, Main: Add, Radio, x114 y76 w80 h23 vRadio5 Checked%Radio5%, 1280x960
Gui, Main: Add, Radio, x12 y76 w100 h23 vRadio6 Checked%Radio6%, 1920x1080 | 5:4
Gui, Main: Add, Radio, x114 y50 w80 h23 vRadio7 Checked%Radio7%, 1280x1024

Gui, Main: Add, Edit, x206 y50 w48 h21 vDimension +number cblack, %Dimension%
Gui, Main: Add, Text, x259 y53 w130 h14 +0x200, Дименшен

Gui, Main: Add, Text, x372 y28 w138 h14 +0x200 , Дискорды
Gui, Main: Add, Text, x440 y53 w115 h14 +0x200, Дискорд 
Gui, Main: Add, Edit, x319 y50 w65 h21 vdis cblack, %dis%
Gui, Main: Add, Edit, x390 y50 w45 h21 vtag +Number cblack, %tag%


Gui, Main: Add, Text, x440 y79 w90 h14 +0x200 , Дискорд ГА
Gui, Main: Add, Edit, x319 y76 w65 h21 vgadis cblack, %gadis%
Gui, Main: Add, Edit, x390 y76 w45 h21 vgatag +Number cblack, %gatag%

Gui, Main: Add, Text, x440 y105 w115 h14 +0x200, Дискорд зГА 
Gui, Main: Add, Edit, x319 y102 w65 h21 vzgadis cblack, %zgadis%
Gui, Main: Add, Edit, x390 y102 w45 h21 vzgatag +Number cblack, %zgatag%

Gui, Main: Add, Text, x526 y28 w190 h14 +0x200 , Расположение счетчика/памятки
Gui, Main: Add, Text, x573 y53 w80 h14 +0x200, Координата X
Gui, Main: Add, Text, x573 y79 w80 h14 +0x200, Координата Y
Gui, Main: Add, Edit, x520 y50 w48 h21 vX +number cblack, %X%
Gui, Main: Add, Edit, x520 y76 w48 h21 vY +number cblack, %Y%

Gui, Main: Add, Text, x573 y105 w130 h14 +0x200, Координата X (Памятка)
Gui, Main: Add, Text, x573 y131 w140 h14 +0x200, Координата Y (Памятка)

Gui, Main: Add, Edit, x520 y102 w48 h21 vX2 +number cblack, %X2%
Gui, Main: Add, Edit, x520 y128 w48 h21 vY2 +number cblack, %Y2%

Gui, Main: Add, Text, x38 y160 w120 h14 +0x200, Временное лидерство
Gui, Main: Add, Text, x65 y185 w120 h14 +0x200, Номер фракции
Gui, Main: Add, Edit, x12 y182 w48 h21 vFraction +number cblack, %Fraction%

Gui, Main: Add, Button, x10 y310 w64 h21 gSaveData, Сохранить
Gui, Main: Add, Text, x12 y382 w130 h15 +0x200 +BackgroundTrans +border, ahk by itserbaa

;динамик
SaveData1: 
Gui, Main: Submit, NoHide
IniWrite, %Dinamic%, %A_ScriptDir%\res\Settings.ini, ID, Dinamic
sleep 200
return
:*:.мой ::
    ; Ждем ввода следующих символов после "мой "
    Input, UserInput, V L4 T10, {Space}{Tab}{Enter}{Escape} ; Считываем до 4 символов или до пробела, табуляции, Enter или Escape
    ; Проверяем, содержит ли введенная строка от 1 до 4 цифр
    if (RegExMatch(UserInput, "^\d{1,4}$"))
    {
        ; Если да, копируем цифры в переменную
        NewValue := UserInput

        ; Путь к файлу Settings.ini в той же папке, что и скрипт
        iniFilePath := A_ScriptDir . "\res\Settings.ini"

        ; Проверяем, существует ли файл
        if (FileExist(iniFilePath))
        {
            ; Записываем новые цифры в файл ini
            IniWrite, %NewValue%, %iniFilePath%, ID, Dinamic

            ; Проверяем, успешно ли обновлено значение
            IniRead, CheckValue, %iniFilePath%, ID, Dinamic
            if (CheckValue = NewValue)
            {
                
            }
            else
            {
                MsgBox, Failed to write value to the ini file.
            }

            ; Вставляем цифры
            Clipboard := NewValue
            Sleep 500
            SendInput, {backspace 5}
            Sleep 500
            Send,Ваш ID Установлен: ^v {enter}
        }
        else
        {
            MsgBox, File not found: %iniFilePath%
        }
    }
    else
    {
        ; Если нет, возвращаем ввод обратно
        SendInput, % ".мой " UserInput
    }
return


;настройки
SaveData:
Gui, Submit, NoHide
IniWrite, %Radio1%, %A_ScriptDir%\res\Settings.ini, Resolution, 1920x1080
IniWrite, %Radio3%, %A_ScriptDir%\res\Settings.ini, Resolution, 1680x1050
IniWrite, %Radio2%, %A_ScriptDir%\res\Settings.ini, Resolution, 1600x900
IniWrite, %Radio4%, %A_ScriptDir%\res\Settings.ini, Resolution, 1366x768
IniWrite, %Radio5%, %A_ScriptDir%\res\Settings.ini, Resolution, 1280x960
IniWrite, %Radio6%, %A_ScriptDir%\res\Settings.ini, Resolution, 1920x10802
IniWrite, %Radio7%, %A_ScriptDir%\res\Settings.ini, Resolution, 1280х1024

IniWrite, %Radio8%, %A_ScriptDir%\res\Settings.ini, Login Commands, /settimelocal 18 00 00
IniWrite, %Radio9%, %A_ScriptDir%\res\Settings.ini, Login Commands, /gm
IniWrite, %Radio10%, %A_ScriptDir%\res\Settings.ini, Login Commands, /dl
IniWrite, %Radio11%, %A_ScriptDir%\res\Settings.ini, Login Commands, /esp3
IniWrite, %Radio12%, %A_ScriptDir%\res\Settings.ini, Login Commands, /templeader
IniWrite, %Radio13%, %A_ScriptDir%\res\Settings.ini, Login Commands, /chide
IniWrite, %Radio14%, %A_ScriptDir%\res\Settings.ini, Login Commands, /zzdebug
IniWrite, %Radio15%, %A_ScriptDir%\res\Settings.ini, Login Commands, /setweatherlocal extrasunny
IniWrite, %Radio16%, %A_ScriptDir%\res\Settings.ini, Login Commands, /togglesnow 0
IniWrite, %Radio17%, %A_ScriptDir%\res\Settings.ini, Login Commands, Ваш ID

IniWrite, %Hot1%, %A_ScriptDir%\res\Settings.ini, Binds, KEY1
IniWrite, %Hot2%, %A_ScriptDir%\res\Settings.ini, Binds, KEY2
IniWrite, %Hot3%, %A_ScriptDir%\res\Settings.ini, Binds, KEY3
IniWrite, %Hot4%, %A_ScriptDir%\res\Settings.ini, Binds, KEY4
IniWrite, %Hot4%, %A_ScriptDir%\res\Settings.ini, Binds, KEY5

IniWrite, %X%, %A_ScriptDir%\res\Settings.ini, Coords, X
IniWrite, %Y%, %A_ScriptDir%\res\Settings.ini, Coords, Y
IniWrite, %X2%, %A_ScriptDir%\res\Settings.ini, Coords, X2
IniWrite, %Y2%, %A_ScriptDir%\res\Settings.ini, Coords, Y2
IniWrite, %Dimension%, %A_ScriptDir%\res\Settings.ini, Dimension, Dimension
IniWrite, %Fraction%, %A_ScriptDir%\res\Settings.ini, Fraction, Fraction

IniWrite, %dis%, %A_ScriptDir%\res\Settings.ini, Discord, dis
IniWrite, %tag%, %A_ScriptDir%\res\Settings.ini, Discord, tag
IniWrite, %gadis%, %A_ScriptDir%\res\Settings.ini, Discord, gadis
IniWrite, %gatag%, %A_ScriptDir%\res\Settings.ini, Discord, gatag
IniWrite, %zgadis%, %A_ScriptDir%\res\Settings.ini, Discord, zgadis
IniWrite, %zgatag%, %A_ScriptDir%\res\Settings.ini, Discord, zgatag
Reload
return

;счетчик
mess: 
labelgo:
if (radio1 == 1)
{
SendInput, {Enter}
Sleep 1000
MouseGetPos, 186, 40	
PixelGetColor, color, 186, 40 alt
Var1 = %color%
if ( Var1 = 0x005A1CE8  ) | ( Var1 = 0x005912FB  ) | ( Var1 = 0x008313FF  ) | ( Var1 = 0x006619E9  )
{
counter++
GoSub, UpdateCounter
Clipboard :=
}
}
else if (Radio2 == 1)
{
SendInput, {Enter}
Sleep 1000
MouseGetPos, 152, 45
PixelGetColor, color, 152, 45 alt
Var1 = %color%
if ( Var1 = 0x005A1CE8  ) | ( Var1 = 0x005912FB  ) | ( Var1 = 0x008313FF  ) | ( Var1 = 0x006619E9  )
{
counter++
GoSub, UpdateCounter
Clipboard :=
}
}
else if (Radio3 == 1)
{
SendInput, {Enter}
Sleep 1000
MouseGetPos, 178, 54
PixelGetColor, color, 178, 54  alt
Var1 = %color%
if ( Var1 = 0x005A1CE8  ) | ( Var1 = 0x005912FB  ) | ( Var1 = 0x008313FF  ) | ( Var1 = 0x006619E9  )
{
counter++
GoSub, UpdateCounter
Clipboard :=
}
}
else if (Radio6 == 1)
{
SendInput, {Enter}
Sleep 1000
MouseGetPos, 183, 55
PixelGetColor, color, 183, 55 alt
Var1 = %color%
if ( Var1 = 0x005A1CE8  ) | ( Var1 = 0x005912FB  ) | ( Var1 = 0x008313FF  ) | ( Var1 = 0x006619E9  )
{
counter++
GoSub, UpdateCounter
Clipboard :=
}
}
else if (Radio4 == 1)
{
SendInput, {Enter}
Sleep 1000
MouseGetPos, 130, 40
PixelGetColor, color, 130, 40 alt
Var1 = %color%
if ( Var1 = 0x005A1CE8  ) | ( Var1 = 0x005912FB  ) | ( Var1 = 0x008313FF  ) | ( Var1 = 0x006619E9  )
{
counter++
GoSub, UpdateCounter
Clipboard :=
}
}
else if (Radio7 == 1)
{
SendInput, {Enter}
Sleep 1000
MouseGetPos, 174, 51
PixelGetColor, color, 174, 51 alt 
Var1 = %color%
if ( Var1 = 0x005A1CE8  ) | ( Var1 = 0x005912FB  ) | ( Var1 = 0x008313FF  ) | ( Var1 = 0x006619E9  )
{
counter++
GoSub, UpdateCounter
Clipboard :=
}
}
else if (Radio5 == 1)
{
SendInput, {Enter}
Sleep 1000
MouseGetPos, 174, 51
PixelGetColor, color, 163, 51 alt 163, 51
Var1 = %color%
if ( Var1 = 0x005A1CE8  ) | ( Var1 = 0x005912FB  ) | ( Var1 = 0x008313FF  ) | ( Var1 = 0x006619E9  )
{
counter++
GoSub, UpdateCounter
Clipboard :=
}
}
return 

UpdateCounter1:
IniWrite, %DayANS%, %A_ScriptDir%\res\Settings.ini, ANS, DayANS
IniRead, DayANS, %A_ScriptDir%\res\Settings.ini, ANS, DayANS
IniWrite, %WeekANS%, %A_ScriptDir%\res\Settings.ini, ANS, WeekANS
IniRead, WeekANS, %A_ScriptDir%\res\Settings.ini, ANS, WeekANS
GuiControl,, MyText, День: %DayANS%
GuiControl,, MyTotalR, Неделя: %WeekANS%
return

UpdateCounter2:
DayANS-=1
WeekANS-=1
IniWrite, %DayANS%, %A_ScriptDir%\res\Settings.ini, ANS, DayANS
IniRead, DayANS, %A_ScriptDir%\res\Settings.ini, ANS, DayANS
IniWrite, %WeekANS%, %A_ScriptDir%\res\Settings.ini, ANS, WeekANS
IniRead, WeekANS, %A_ScriptDir%\res\Settings.ini, ANS, WeekANS
GuiControl,, MyText, День: %DayANS%
GuiControl,, MyTotalR, Неделя: %WeekANS%
return

UpdateCounter:
DayANS+=1
WeekANS+=1
IniWrite, %DayANS%, %A_ScriptDir%\res\Settings.ini, ANS, DayANS
IniRead, DayANS, %A_ScriptDir%\res\Settings.ini, ANS, DayANS
IniWrite, %WeekANS%, %A_ScriptDir%\res\Settings.ini, ANS, WeekANS
IniRead, WeekANS, %A_ScriptDir%\res\Settings.ini, ANS, WeekANS
GuiControl,, MyText, День: %DayANS%
GuiControl,, MyTotalR, Неделя: %WeekANS%
return

Reports:
sendinput, {F8} 
sleep 50
mousemove 494, 161
return

OpenSite:
    Run, https://docs.google.com/spreadsheets/d/1UNmIeS1-vYGEoT0-ScQwgDZTd4ciuIbMJXTwZhyMM7U/edit?gid=556123862#gid=556123862
return

OpenAnotherSite:
    Run, https://docs.google.com/spreadsheets/d/1lfVC-gmKEZ-zxXrh4btZdIeHB6F2P2-_HhUyw1qk1dI/edit?usp=sharing
return

	Info:
    Gui, Info: Color, 1e2124
    Gui, Info: Font, s12, Segoe UI
    Gui, Info: Font, cwhite
	Gui, Info: Add, Text, x8 y8  h23 +0x200,АХК создан для облегчения работы администрации.
    Gui, Info: Add, Text, x8 y32  h23 +0x200, 
    Gui, Info: Add, Text, x8 y56  h23 +0x200,АХК автоматически считает кол-во отвеченных репортов в день и в неделю,
    Gui, Info: Add, Text, x8 y80  h23 +0x200, если писать в репорт .ку, .да, .нет
    Gui, Info: Add, Text, x8 y104  h23 +0x200,
    Gui, Info: Add, Text, x8 y128  h23 +0x200,
    Gui, Info: Add, Text, x8 y152  h23 +0x200, Все команды, телепорты, наказания можно вводить транслитом. Пр.: .ез -> /tp
    Gui, Info: Add, Text, x8 y176  h23 +0x200, 
    Gui, Info: Add, Text, x8 y200  h23 +0x200, Для корректной работы софта необходимо выбрать разрешение экрана, ваш 
    Gui, Info: Add, Text, x8 y224  h23 +0x200, дискорд, сервер и ваш пол в настройках.
    Gui, Info: Add, Text, x8 y248  h23 +0x200, 
    Gui, Info: Add, Text, cred x8 y272  h23 +0x200, Хоткеи:
	Gui, Info: Add, Text, x8 y320  h23 +0x200,Ctrl + F9 - Перезапустить.
    Gui, Info: Add, Text, x8 y296  h23 +0x200,Ctrl + F10 - Закрыть.
    Gui, Info: Add, Text, x8 y344  h23 +0x200,
    Gui, Info: Add, Text, x8 y368  h23 +0x200, Если что-то сломалось/не работает/есть идеи и т.п. писать - itserbaa
    Gui, Info: Show, h390 w600, Информация
	Return

repm:
counter++
GoSub, UpdateCounter2
Clipboard :=
return

rep:
counter++
GoSub, UpdateCounter
Clipboard :=
return

mtp:
BlockInput, SendAndMouse
SendInput, {sc14}
Sleep 150
SendInput, /specoff{Enter}
Sleep 300
SendInput, {F5}
return

mclcommand:
SendMessage, 0x50,, 0x4090409
SendInput, {T}
Sleep 300
SendInput, /subs_to_map_sync 1{Enter}
Sleep 300
SendInput, {T}
Sleep 300
SendInput, /enable_map_players_sync 1 55{Enter}
Sleep 300
SendInput, {T}
Sleep 300
SendInput, /waypoints_toggle{Enter}
Sleep 300
SendInput, {T}
Sleep 300
SendInput, /togglesnow 0{Enter}
Sleep 300
SendInput, {T}
Sleep 300
SendInput, /setweatherlocal extrasunny{Enter}
Sleep 300
SendInput, {T}
Sleep 300
SendInput, /frange 99999999999999999999999 
return

vhod:
SendMessage, 0x50,, 0x4090409
if (Radio12==1)
{
SendInput, {T}
Sleep 300
SendInput, /templeader %Fraction%{Enter}
Sleep 300
}
if (Radio9==1)
{
SendInput, {T}
Sleep 300
SendInput, /gm{Enter}
Sleep 300
}
if (Radio11==1)
{
SendInput, {T}
Sleep 300
SendInput, /esp3{Enter}
Sleep 300
}
if (Radio13==1)
{
SendInput, {T}
Sleep 300
SendInput, /chide{Enter}
Sleep 300
}
if (Radio8==1)
{
SendInput, {T}
Sleep 300
SendInput, /settimelocal 18 00 00{Enter}
Sleep 300
}
if (Radio10==1)
{
SendInput, {T}
Sleep 300
SendInput, /dl{Enter}
Sleep 300
}
if (Radio14==1)
{
SendInput, {T}
Sleep 300
SendInput, /zzdebug{Enter}
Sleep 300
}
if (Radio15==1)
{
SendInput, {T}
Sleep 300
SendInput, /setweatherlocal extrasunny{Enter}
Sleep 300
}
f (Radio16==1)
{
SendInput, {T}
Sleep 300
SendInput, /togglesnow 0{Enter}
Sleep 300
}
if (Radio17==1)
{
SendInput, {T}
Sleep 300
SendInput, Укажите ваш динамический ID{space}
; Ждем ввода следующих символов после "мой "
    Input, UserInput, V L4 T10, {Space}{Tab}{Enter}{Escape} ; Считываем до 4 символов или до пробела, табуляции, Enter или Escape
    ; Проверяем, содержит ли введенная строка от 1 до 4 цифр
    if (RegExMatch(UserInput, "^\d{1,4}$"))
    {
        ; Если да, копируем цифры в переменную
        NewValue := UserInput

        ; Путь к файлу Settings.ini в той же папке, что и скрипт
        iniFilePath := A_ScriptDir . "\res\Settings.ini"

        ; Проверяем, существует ли файл
        if (FileExist(iniFilePath))
        {
            ; Записываем новые цифры в файл ini
            IniWrite, %NewValue%, %iniFilePath%, ID, Dinamic

            ; Проверяем, успешно ли обновлено значение
            IniRead, CheckValue, %iniFilePath%, ID, Dinamic
            if (CheckValue = NewValue)
            {
                
            }
            else
            {
                MsgBox, Failed to write value to the ini file.
            }

            ; Вставляем цифры
            Clipboard := NewValue
            Sleep 500
            SendInput,{Enter}
            Sleep 500
             SendInput,{T}
            Sleep 500
            Send,Ваш динамический ID: ^v {enter}
        }
        else
        {
            MsgBox, File not found: %iniFilePath%
        }
    }
    else
    {
        ; Если нет, возвращаем ввод обратно
        SendInput, % ".мой " UserInput
    }
}
return

;Телепорты
:?:.клп::/ctp -196.836 6218.708 31.491 
:?:.клс::/ctp 1728.313 3717.568 34.109
:?:.клм::/ctp -361.424 -129.636 38.696
:?:.клг::/ctp -40.529 -1077.648 26.653

:?:.пд::/ctp 429 -980 30.50
:?:.бол::/ctp 1155 -1524 34
:?:.шд::/ctp -434.87 6024.54 31.50
:?:.шд2::/ctp 1843.770 3666.384 33.760
:?:.фз::/ctp -2336 3257 32.50
:?:.мэр::/ctp -534.70 -222.07 37.60
:?:.визл::/ctp -593 -929 24
:?:.фиб::/ctp 2527 -377 93

:?:.бал::/ctp -70.06 -1824.64 26.94
:?:.ваг::/ctp 967 -1817 31
:?:.фэм::/ctp -204.29 -1513.69 31.60
:?:.бладс::/ctp 496 -1330 29.40
:?:.мара::/ctp 1009 -2520 28

:?:.лкн::/ctp 1385 1154 114.40
:?:.рм::/ctp -1526 858 181
:?:.як::/ctp -1556.36 113.07 57
:?:.мекс::/ctp 381.03 23.12 91.40
:?:.ам::/ctp -1895.23 2027.19 141
:?:.ир::/ctp -3028.926 100.118 11.614

:?:.лост::/ctp 969.84 -128.40 74.40
:?:.аод::/ctp 1995.99 3062.44 47.06

:?:.груб::/ctp -3022 105 11.30
:?:.клаб::/ctp 1588.65 6445.38 25
:?:.рич::/ctp -1302.49 294.52 64.50
:?:.манор::/ctp -58.20 343.73 111.80
:?:.конт::/ctp -1865.51 -355.96 57

:?:.хум::/ctp 3569.54 3789.48 30
:?:.техи::/ctp 180 -2847 20
:?:.меды::/ctp 185 -2575 21
:?:.мейз::/ctp -75 -818 326
:?:.каз::/ctp 916 50 81
:?:.аш::/ctp -620 -2264 6
:?:.гг::/ctp -257 -2023 30
:?:.бургер::/ctp -1171.31 -890.20 13.90
:?:.багама::/ctp -1391.30 -585.35 30
:?:.кайо::/ctp 4488.58 -4493.52 4
:?:.авиа::/ctp 3035.21 -4688.55 15
:?:.мол::/ctp 61.67 -1751.80 47
:?:.трас::/ctp 7400 3946 1124
:?:.трасс::/ctp 7400 -656 1124
:?:.аук::/ctp -833 -699.50 27
:?:.бокс::/ctp 8.56 -1658.55 28.71
:?:.бар::/ctp -305.09 6259.59 30.92
:?:.бк::/ctp 500.44 109.79 96.49
:?:.ванила::/ctp 131.33 -1302.93 29.23
:?:.починка::/ctp -1430.45 -450.5 35.91
:?:.лск4::/ctp 1175.47 2671.33 37.85
:?:.порт::/ctp 417 -2501 13.46
:?:.стр::/ctp 1304 1453 98.87
:?:.лес::/ctp -321 6093 31.14
:?:.бмара::/ctp 1302 -1646 51.04
:?:.самол::/ctp 1473 2730 37.38
:?:.чил::/ctp 498 5592 795
:?:.сэнди::/ctp 1843.770 3666.384 33.760
:?:.палето::/ctp -434.87 6024.54 31.50

:?:/rkg::/ctp -196.836 6218.708 31.491 
:?:/rkc::/ctp 1728.313 3717.568 34.109
:?:/rkv::/ctp -361.424 -129.636 38.696
:?:/rku::/ctp -40.529 -1077.648 26.653 


:?:/kcgl::/ctp 429 -980 30.50
:?:/,jk::/ctp 1155 -1524 34
:?:/il::/ctp -434.87 6024.54 31.50
:?:/il2::/ctp 1843.770 3666.384 33.760
:?:/ap::/ctp -2336 3257 32.50
:?:/v'h::/ctp -534.70 -222.07 37.60
:?:/dbpk::/ctp -593 -929 24
:?:/ab,::/ctp 2527 -377 93

:?:/,fk::/ctp -70.06 -1824.64 26.94
:?:/dfu::/ctp 967 -1817 31
:?:/a'v::/ctp -204.29 -1513.69 31.60
:?:/,kflc::/ctp 496 -1330 29.40
:?:/vfhf::/ctp 1009 -2520 28 

:?:/kry::/ctp 1385 1154 114.40
:?:/hv::/ctp -1526 858 181
:?:/zr::/ctp -1556.36 113.07 57
:?:/vtrc::/ctp 381.03 23.12 91.40
:?:/fv::/ctp -1895.23 2027.19 141
:?:/bh::/ctp -3028.926 100.118 11.614

:?:/kjcn::/ctp 969.84 -128.40 74.40
:?:/ajl::/ctp 1995.99 3062.44 47.06

:?:/[ev::/ctp 3569.54 3789.48 30
:?:/vtqp::/ctp -75 -818 326
:?:/rfp::/ctp 916 50 81
:?:/fi::/ctp -620 -2264 6
:?:/uu::/ctp -257 -2023 30
:?:/,ehuth::/ctp -1171.31 -890.20 13.90
:?:/,fufvf::/ctp -1391.30 -585.35 30
:?:/rfqj::/ctp 4488.58 -4493.52 4
:?:/fdbf::/ctp 3035.21 -4688.55 15
:?:/vjk::/ctp 61.67 -1751.80 47
:?:/nhfc::/ctp 7400 3946 1124
:?:/nhfcc::/ctp 7400 -656 1124
:?:/fec::/ctp -833 -699.50 27
:?:/,jrc::/ctp 8.56 -1658.55 28.71
:?:/,fh::/ctp -305.09 6259.59 30.92
:?:/,r::/ctp 500.44 109.79 96.49
:?:/dfybkf::/ctp 131.33 -1302.93 29.23
:?:/gjxbyrf::/ctp -1430.45 -450.5 35.91
:?:/kcr4::/ctp 1175.47 2671.33 37.85
:?:/gjhn::/ctp 417 -2501 13.46
:?:/cnh::/ctp 1304 1453 98.87
:?:/ktc::/ctp -321 6093 31.14
:?:/,vfhf::/ctp 1302 -1646 51.04
:?:/cfvjk::/ctp 1473 2730 37.38
:?:/xbk::/ctp 498 5592 795
:?:/c'ylb::/ctp 1843.770 3666.384 33.760
:?:/gfktnj::/ctp -434.87 6024.54 31.50

:?:.обыч::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput, /setdim %Dinamic% 0{Enter}
return

:?:/j,sx::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput, /setdim %Dinamic% 0{Enter}
return

;ган
:?:.миниг::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput,/gw %Dinamic% weapon_minigun 9999
return
:?:.ревик::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput,/gw %Dinamic% weapon_revolver 9999
return
:?:.ракет::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput,/gw %Dinamic% weapon_firework 9999
return
:?:.хевик::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput,/gw %Dinamic% weapon_heavysniper_mk2 9999
return
:?:.топор::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput,/gw %Dinamic% weapon_hatchet  9999
return

:?:/vbybu::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput,/gw %Dinamic% weapon_minigun 9999
return
:?:/htdbr::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput,/gw %Dinamic% weapon_revolver 9999
return
:?:/hfrtn::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput,/gw %Dinamic% weapon_firework 9999
return
:?:/[tdbr::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput,/gw %Dinamic% weapon_heavysniper_mk2 9999
return
:?:/njgjh::
IniRead, Dinamic, %A_ScriptDir%\res\Settings.ini, ID, Dinamic 
if Dinamic = 
{
msgbox,16, Ошибка, Динамик не введен!
}
else
SendInput,/gw %Dinamic% weapon_hatchet  9999
return

; Команды
:?:/bc::/bancheck
:?:.ис::/bancheck
:?:/jc::/ajailcheck 
:?:.ос::/ajailcheck 
:?:.ифтсрусл::/bancheck
:?:.фофшдсрусл::/ajailcheck 
:?:/tf::/tempfamily 
:?:.еа::/tempfamily 
:?:/sm::/setmaterials 
:?:.ыь::/setmaterials 
:?:/tn::/tempname
:?:.ет::/tempname 
:?:.еуьзтфьу::.еуьзтфьу 
:?:.яяв::/zzdebug 
:?:/zzd::/zzdebug 
:?:/Usefull::/addUsefullitheater 
:?:.фьзр::/addUsefullitheater 
:?:/rUsefull::/removeUsefullitheater 
:?:.кфьзр::/removeUsefullitheater 
:?:/gzone::/togglegreenzone 
:?:.пящту::/togglegreenzone 
:?:/mc::/mutecheck 
:?:.ьс::/mutecheck 
:?:.ьгеусрусл::/mutecheck 
:?:.гтофшд::/unjail 
:?:.цфкт::/warn 
:?:/ld::/lastdriver 
:?:.дв::/lastdriver 
:?:/af::/ainfect 
:?:.фа::/ainfect 
:?:/sk::/skick 
:?:.ыл::/skick 
:?:/k::/kick 
:?:.л::/kick 
:?:/ai::/auninvite 
:?:.фш::/auninvite 
:?:.аи::/fb 
:?:/aif::/ainfect  
:?:.фша::/ainfect 
:?:.с::/c  
:?:.си::/cb 
:?:.гтьгеу::/unmute 
:?:.пшв::/gid 
:?:.фвьшты::/admins{enter} 
:?:.фштаусе::/ainfect 
:?:.умутещт::/eventon 
:?:.умутещаа::/eventoff 
:?:.пц::/gw 
:?:.мур::/veh 
:?:.ашчсфк::/fixcar 
:?:.уьздуфвук::/templeader 
:?:/tl::/templeader 
:?:.ед::/templeader 
:?:.ылшсл::/skick 
:?:.кузфшк::/repair 
:?:.фгтшмшеу::/auninvite 
:?:.учсфк::/excar 
:?:.агуд::/fuel 
:?:.згддекгтл::/pulltrunk 
:?:.акууя::/freez 
:?:.езсфк::/tpcar 
:?:.дфыевкшмук::/lastdriver 
:?:.вудшеуь::/delitem 
:?:/gc::/getcar 
:?:.пс::/getcar 
:?:.фв::/admins{enter} 
:?:/ad::/admins{enter} 
:?:.з::/players 
:?:/p::/players 
:?:.здфнукы::/players 
:?:.рес::/rescue 
:?:/htc::/rescue 
:?:.ез::/tp 
:?:.ызус::/spec 
:?:.ызусщаа::/specoff {Enter} {F5}
:?:.фыьы::/asms 
:?:.ф::/a 
:?:/sp::/spec 
:?:.ыз::/spec 
:?:/so::/specoff {Enter} {F5}
:?:.ыщ::/specoff {Enter} {F5}
:?:.килл::/hp 0{left 2}
:?:/kill::/hp 0{left 2}
:?:.лшдд::/hp 0{left 2}
:?:.штсфк::/incar 
:?:.пр::/gh 
:?:.пиздец::<@&1118255513046614137> и <@&1118255559221727322>. Уважаемая администрация, просим зайти вас на сервер, в данный момент нам очень нужна ваша помощь.
:?:.штм::/inv 
:?:.шв::/id 
:?:.рз::/hp 
:?:.од::/ajail 
:?:.фофшд::/ajail 
:?:.лшсл::/kick 
:?:.ылшсл::/skick 
:?:.кузфшк::/repair 
:?:.вд::/dl 
:?:.уыз::/esp 
:?:.уыз2::/esp2 
:?:.пуесфк::/getcar 
:?:.ифт::/ban 
:?:.вудмур::/delveh 
:?:.ьез::/mtp 
:?:.мур::/veh 
:?:.фмур::/aveh 
:?:.рфквифт::/hardban 
:?:.ьгеу::/mute 
:?:.пшв::/gid 
:?:.ср::/chide 
:?:/ch::/chide 
:?:.куысгу::/rescue 
:?:.ыуевшь::/setdim 
:?:/sd::/setdim 
:?:.и::/b 
:?:.ц::/w 
:?:.ыв::/setdim 
:?:.сршву::/chide 
:?:.афк::/a афк мин{left 4}
:?:/far::/a афк мин{left 4}
:?:.фгтсгаа::/auncuff 
:?:.фсгаа::/acuff 
:?:.акууяу::/freeze
:?:/scd::/setcardim 
:?:.ыуесфквшь::/setcardim 
:?:.ысв::/setcardim 
:?:/rst::/resettempname 
:?:.кые::/resettempname 
:?:.куыуееуьзтфьу::/resettempname 
:?:.ты::/netstat 
:?:/ns::/netstat 
:?:.вм::/delveh 
:?:/dv::/delveh 
:?:/hard::/hardban 
:?:.рфкв::/hardban 
:?:/as::/asms 
:?:.фы::/asms 
:?:.пез::/gtp
:?:.пь::/gm
:?:.тс::/noclip 
:?:/nc::/noclip 
:?:/acf::/acuff 
:?:.фса::/acuff 
:?:/auf::/auncuff 
:?:.фга::/auncuff 
:?:.а::/f 
:?:.ылшт::/skin
:?:.езр::/tph
:?:.фмур::/aveh
:?:.фдщсл::/alock
:?:.гти::/unban 
:?:/unb::/unban
:?:.гто::/unjail
:?:/unj::/unjail
:?:/dvr::/delvehrange 
:?:.вмк::/delvehrange 
:?:.щи::/objdl
:?:/ob::/objdl

:?:.краш::
SendMessage, 0x50,, 0x4090409
SendInput, Если у Вас есть доказательства краша - предоставьте его мне в личные сообщения дискорда. Я вас выпущу. Мой дискорд: %dis%%tag%.
Return

:?:.дс::
SendMessage, 0x50,, 0x4090409
SendInput, Предоставьте видеодоказательство мне в личные сообщения дискорда: %dis%%tag%. 
Return

:?:.дс2::
SendMessage, 0x50,, 0x4090409
SendInput, Предоставьте видеодоказательство любому администратору в личные сообщерния дискорда.
Return

:?:.га::
SendMessage, 0x50,, 0x4090409
SendInput, Обратитесь в личные сообщения дискорда к главному администратору: %gadis%%gatag%.
Return

:?:.зга::
SendMessage, 0x50,, 0x4090409
SendInput, Обратитесь в личные сообщения дискорда к заместителю главного администратора: %zgadis%%zgatag%.
Return

:?:.дсс::
SendMessage, 0x50,, 0x4090409
SendInput, Обратитесь ко мне в личные сообщения дискорда: %dis%%tag%.
Return

:?:.актуал::
SendMessage, 0x50,, 0x4190419,, A
Random, Var, 1, 4
SendInput, % TextArray1[Var]
TextArray1 := ["Приносим извинения за столь долгое ожидание. Пожалуйста, если проблема еще актуальна, продублируйте её в своем обращении. Спасибо за понимание."
            , "Продублируйте, если ваша проблема актуальна. Спасибо за понимание."
            , "Продублируйте свое обращение, если проблема все еще актуальна. Спасибо за ожидание и понимание."
            , "Если проблема актуальна - продублируйте свое обращение."]
return

:?:/frnefk::
SendMessage, 0x50,, 0x4190419,, A
Random, Var, 1, 4
SendInput, % TextArray1[Var]
TextArray1 := ["Приносим извинения за столь долгое ожидание. Пожалуйста, если проблема еще актуальна, продублируйте её в своем обращении. Спасибо за понимание."
            , "Продублируйте, если ваша проблема актуальна. Спасибо за понимание."
            , "Продублируйте свое обращение, если проблема все еще актуально. Спасибо за ожидание и понимание."
            , "Если проблема актуальна - продублируйте свое обращение."]
return

:?:/rhfi::
SendMessage, 0x50,, 0x4090409
SendInput, Если у Вас есть доказательства краша - предоставьте его мне в личные сообщения дискорда. Я вас выпущу. Мой дискорд: %dis%%tag%.
Return

:?:/lc::
SendMessage, 0x50,, 0x4090409
SendInput, Предоставьте видеодоказательство мне в личные сообщения дискорда: %dis%%tag%. 
Return

:?:/lc2::
SendMessage, 0x50,, 0x4090409
SendInput, Предоставьте видеодоказательство любому администратору в личные сообщерния дискорда.
Return

:?:/uf::
SendMessage, 0x50,, 0x4090409
SendInput, Обратитесь в личные сообщения дискорда к главному администратору: %gadis%{#}%gatag%.
Return

:?:/puf::
SendMessage, 0x50,, 0x4090409
SendInput, Обратитесь в личные сообщения дискорда к заместителю главного администратора: %zgadis%{#}%zgatag%.
Return

:?:/lbc::
SendMessage, 0x50,, 0x4090409
SendInput, Обратитесь ко мне в личные сообщения дискорда: %dis%%tag%.
Return

; Ответы "репорты"
:?:.кур::Передам кураторам.
:?:.пер::Передам.
:?:.неоф::Не оффтопьте в обращения.
:?:.непр::Не предоставляем подобную информацию.
:?:.хз::Не владеем данной информацией.
:?:.хз2::Не владеем данной информацией. Следите за новостями.
:?:.багс::Рестарт был, но задания не обновились, видимо какой то баг, ожидайте исправления.
:?:.зкр::Закрываю репорт?
:?:.чит::Предоставьте доказательства любому администратору с ролью Cheat Hunter в личные сообщения в дискорде.
:?:.бб::Вы вышли с сервера, закрываю репорт.
:?:.сид::Укажите static ID нарушителя.
:?:.ид::Укажите, пожалуйста, ID нарушителя.
:?:.виз::Визуальный баг, перезайдите на сервер.
:?:.баг::Знаем о данной проблеме, она уже передана разработчикам. Приносим свои извинения за предоставленные неудобства.
:?:.рп::Извините, но это РП процесс, мы не вправе вмешиваться в него.
:?:.урп::Данную информацию вы можете получить при взаимодействии с другими игроками/самостоятельным поиском непосредственно во время игрового процесса, либо другим доступным IC путем. 
:?:.тех::Напишите в технический раздел на форуме.
:?:.техдс::Напишите в технический раздел официального дискорд сервера "Помощь по игре" - "тех-поддержка".
:?:.увал::К сожалению, ничем не можем помочь, увольняем только в случае, если у фракции нет лидера. Дождитесь своего лидера/заместителей.
:?:.релог::У вас баг, вам нужно перезайти на сервер.
:?:.нак::Игрок получил наказание.
:?:.п16::администрация не разглашает подробности наказаний по данному/иным пунктам ПС. вы можете самостоятельно ознакомиться с информацией в документе пользовательского соглашения проекта https://majestic-rp.ru/user-agreement.pdf
:?:.жб::Администрация не может выдавать наказания и выносить какие-либо вердикты не видя всей ситуации с самого начала. Пожалуйста, если у Вас есть видеофиксация данного нарушения - оформите жалобу на форуме, спасибо большое за понимание.
:?:.анак::Обратитесь, пожалуйста, в дискорд к администратору, который выдал вам наказание или рассмотрел жалобу.
:?:.адз::Данный администратор сейчас занят другим делом или отошел от компьютера на короткое время, напишите ему в личные сообщения в дискорде.
:?:.адс::Данный администратор сейчас отсутствует на сервере, напишите ему в личные сообщения в дискорде.
:?:.погода::К сожалению, администрация не контролирует данный процесс. Погода меняется автоматически.
:?:.неп::Не понял суть вашего обращения, опишите Вашу проблему/вопрос подробнее для максимально точного ответа, пожалуйста.
:?:.донат::Обратитесь по почте - help@majestic-rp.ru.
:?:.п::Приятной игры и хорошего настроения.
:?:.нов::Следите за новостями сервера в официальном дискорде проекта. 
:?:.ново::Следите за новостями в официальном дискорде проекта. 
:?:.сделка::Администрация не следит за сделками игроков, запишите видео на случай обмана, чтобы оставить жалобу на игрока на форуме. 
:?:.багзз::Чтобы восстановить прежнюю скорость, заедьте в зеленую зону и выедьте с нее.
:?:.кредит::Любые финансовые договоры (займы, кредиты и т.д) не относятся к ООС сделкам. Все подобные сделки игроки совершают на свой страх и риск. Администрация не несет ответственности и не является гарантом сделки.
:?:.погода::К сожалению администрация не контролирует данный процесс. Погода меняется автоматически. 
:?:.реп::Пожалуйста, уточните свой вопрос подробнее. Администрация не летает на репорты по типу "админ тп", "админ можно поговорить", "помогите", "админ есть вопрос", "последите", Количество символов неограничено, вы можете полностью расписать Вашу проблему/вопрос.
:?:.наг::Сейчас большая нагрузка на сервере оставьте жалобу на Forum или чуть позже в репорт. Надеемся на понимание и просим прощения за предоставленные неудобства.
:?:.неувид::К сожалению администрация не может увидеть это нарушение. Пожалуйста, если у Вас есть видеофиксация данного нарушения - оформите жалобу на форуме, спасибо большое за понимание.
:?:.нетп::Администрация не телепортирует игроков, Вам нужно добраться до места самостоятельно. На проекте достаточно способов, чтобы это сделать: такси, аренда транспорта, автосервисы.
:?:.инв::Это баг инвентаря, предложите обменяться любому игроку и ваша проблема будет решена. Если по близости никого нет, обратитесь ещё раз в репорт и администрация Вам поможет. 
:?:.несл::Администрация не может следить полностью за всем РП процессом, в случае нарушений от игроков - напишите репорт.
:?:.аут::Для подключения Google authenticator вам нужно в меню выбора персонажа открыть раздел настроек.
:?:.вод::Администрация не достает автомобили из воды, а лишь удаляет, чтобы вы могли ее заспавнить. Вам необходимо самостоятельно добраться до автосервиса/аренды т.с или до нужного вам места, например, вы можете вызвать такси.
:?:.бенз::Администрация не заправялет т.с. игроков. Вы можете вызвать такси и добраться до нужного вам места или приобрести канистру, чтобы в дальнейшем доехать до АЗС.
:?:.удал::Администрация не удаляет т.с. игроков. Исключение: т.с. утонуло и не исчезло.
:?:.неув::Не увидел нарушений, если у вас есть видеодоказательства - оставьте жалобу на форуме. 
:?:.фор::Данное нарушение не подлежит рассмотрению через обращение, оставьте жалобу на форуме.
:?:.фжб::Не могу рассмотреть из-за нарушений правил подачи. Автору репорт-жалобы необходимо указывать в названии видео: свой static, static нарушителя, время и дату. Измените название и продублируйте вашу репорт-жалобу.
:?:.зак::Это регламентируется IC законами, Мы не консультируем по ним. Изучить их можете в разделе Government на форуме.
:?:.пго19::Информацию о разрешённой одежды для сотрудника Гос. Организаций можете найти в таблице которую можно найти в 1.19 Правила государственных организаций.
:?:.багдс::Оставьте свой баг-репорт в официальном дискорде проекта: Текстовые каналы - сообщить о баге.

; Ответы "информативки"
:?:.клвл::При достижении 5-го уровня: 500 MC При достижении 10-го уровня: 1000 MC При достижении 15-го уровня: 2000 MC При достижении 20-го уровня: 3000 MC При достижении 25-го уровня: 4000 MC При достижении 30-го уровня: 5000 MC. Каждый следующий уровень после 30-го Вы будете получать 1500 MC. 
:?:.квест::На сервере доступны Мировые и Личные квесты. Ознакомиться с ними можно на рынке (На карте обозначен как "Красный вопрос"). Квесты доступны всем. Личные квесты вы можете проходить неопределенный срок, но, если Вы захотите участвовать в Мировом квесте и получить дополнительные бонусы, то Вам нужно поторопиться выполнить личный квест. Только 5 лучших игроков смогут попасть в топ 3 и залутать дополнительные бонусы. - Каждую неделю доступно по 3 личных и мировых квеста. - Некоторые квесты по типу инкасатора/мусорщика/почтальона можно выполнять в 2-ем и более, засчитывать будем всем.
:?:.фед::На первом этаже стоит NPC у которого можно взять задание. Чтобы отбыть срок в федеральной тюрьме, нужно выполнять задачи. Например помыть туалет - В определенное время тюрьма закрывает клетки на 5 минут, соответственно, в это время отбыть срок нельзя: -- Открываются клетки в 00 минут -- Закрываются клетки в 20 минут на 5 минут -- Открываются клетки в 25 минут -- Закрываются клетки в 55 минут на 5 минут.
:?:.сейф::Закрывать интерфейс сейфа можно только на ESC. В сейф можно класть до 5 миллионов. Деньги идут из налички. Нельзя продать дома в гос, продать игроку, предложить обмен, выставить на аукцион, если в сейфе есть деньги. Сначала требуется их забрать. Если дом слетает по налогам - деньги из сейфа игрок получает в наличку. 
:?:.майки::Для того, чтобы купить майку под верхнюю одежду, вам нужно сначала купить элемент верхней одежды (например, пиджак). После этого вам буду доступны все майки, которые подходят под нее в разделе "Майки".
:?:.фам::/c - IC чат, /cb - OOC чат. 
:?:.фрак::/f - IC чат, /fb - OOC чат. 
:?:.оружлиц::Получить лицензию на оружие можно в LSPD или LSCSD. 
:?:.кан::Чтобы использовать канистру, возьмите её в руки, нажмите G на авто и заправить. 
:?:.емс::К сожалению, администрация не поднимает и не лечит игроков, воспользуйтесь услугами ЕМС.
:?:.ремонт::Для начала, Вам нужно купить запчасть для машины на любо АЗС, после чего открыть капот , нажать G > Починить замок/аккумулятор/залить масло. 
:?:.гос::Вы можете сдать авто на свалку. После сдачи вы получите 75% от гос. стоимости авто. Свалка отмечена на карте как перечеркнутый, красный круг.
:?:.сто::Степень износа определенных деталей автомобиля можно узнать на автомастерской (иконка гаечного ключа с отверткой на карте).
:?:.дон::Задонатить можно на нашем официальном сайте - majestic-rp.ru/donate
:?:.оружрын::Боту на рынке можно сдать оружие только со 100% износом.
:?:.банк::У нас на сервере есть 3 вида банковских карт: Standart, Premium, VIP. Standart карта стоит в обслуживании 500$ в месяц, снятия и переводы без комиссии до 500.000$ после превышения месечного лимита комиссия на вывод 5%(Максимум 20.000$), на перевод 4%(Максимум 20.000$), кэшбек в магазинах отсутствует. Premium карта стоит в обслуживании 25.000$ в месяц, снятия и переводы без комиссии до 2.500.000$ после превышения месечного лимита комиссия на вывод 4%(Максимум 15.000$), на перевод 3%(Максимум 15.000$), кэшбек в магазинах 1%, лимит кэшбека на одну операцию до 2.500$, месечный лимит кэшбека 50.000$. VIP карта стоит в обслуживании 75.000$ в месяц, снятия и переводы без комиссии до 20.000.000$ после превышения месечного лимита комиссия на вывод 3%(Максимум 20.000$), на перевод 2.5%(Максимум 20.000$), кэшбек в магазинах 3%, лимит кэшбека на одну операцию до 10.000$, месечный лимит кэшбека 150.000$. Деньги за обслуживание и лимиты снимаются каждое 1 число нового месяца.
:?:.дублик::Чтобы сделать дубликат ключей от авто необходимо купить заготовку в магазине 24/7, затем нажать G на авто и сделать дубликат.
:?:.клад::Чтобы сделать дубликат от кладовки, необходимо купить заготовку в магазине 24/7, затем через G на игрока "сделать ключ от кладовки" и передать дубликат человеку.
:?:.подсел::Чтобы подселить игрока к себе в дом или же квартиру, стоя около дома, наведитесь на игрока и нажмите G, далее нажмите Подселить.
:?:.замок::Вам необходимо купить "Дверной замок" и "Набор инструментов" на ближайшей заправке, затем подойти к своему транспорту G -> Починить/заменить дверной замок.
:?:.акум::Вам необходимо купить "Аккумулятор" и "Набор инструментов" на ближайшей заправке, затем подойти к своему транспорту G -> Заменить аккумулятор.
:?:.масло::Вам необходимо купить "Моторное масло" и "Набор инструментов" на ближайшей заправке, затем подойти к своему транспорту G -> Заменить масло.
:?:.рем::Чтобы починить своё авто купите рем.комплект на любой АЗС. Через меню G почините Ваш автомобиль.
:?:.госдом::Чтобы продать дом в гос. стоимость, нужно подойти к двери и нажать Е. Вы получите 75% от его гос. цены. Если Вы невовремя оплатите налоги или забудете это сделать, дом слетит автоматически.
:?:.майки::Для того, чтобы купить майку под верхнюю одежду, вам нужно сначала купить элемент верхней одежды (например, пиджак). После этого вам буду доступны все майки, которые подходят под нее в разделе "Майки".
:?:.рыблиц::Получить лицензию на рыбалку вы можете в Мэрии. 
:?:.кости::Чтобы играть в кости вам нужно купить их в любом 24/7. После того как вы купили кости, вы можете подойти к игроку.
:?:.толк::Транспорт можно толкать, нажав G-толкать. Если такой функции нет, при наведении на авто, то этот транспорт толкать нельзя.
:?:.счет::Чтобы узнать номер счета откройте инвентарь и наведитесь мышкой на банковскую карту. 
:?:.пин::Чтобы восстановить пин-код отправляйтесь в банковское отделение, в меню нажмите "Сменить пинкод".
:?:.дрифт::Вам необходимо включить дрифт счётчик через F2 - Настройки - дополнительное. Он появляется во время управляемого заноса и показывает, ваши дрифт очки, чтобы очки засчитывали в задание пропуска нужно набрать более 2.500 поинтов. После кого как вы набрали очки вам необходимо остановиться чтобы они засчитались, главное не врезаться и не перекручивать поворот, иначе очки сбросятся. Дрифт зона отмечена на карте как иконка горящего колеса, пример - одна из зон около LS Vagos.
:?:.скин::Скин появляется в донат инвентаре, его можно будет распылить. Однако при его применении невозможно дальнейшее распыление. Чтобы применить скин: F2 - Магазин - Cкины - Выбираете оружие/бронежилет и скин к нему - Применить, скин применяется ко всем оружиям/бронежилетам выбранного типа. Скин привязывается к игроку, выбить оружие со скином/сбросить/обменять/продать - невозможно.
:?:.заж::Чтобы взломать зажигание сядьте за руль т.с., нажмите G - Взломать зажигание. КД на взлом - 1 час.
:?:.стрим::Режим стримера заменяет символы на звездочки, для обычных игроков он бесполезен. Выключается в F2 - Настройки.
:?:.пар::Положите парашют в быстрый слот, затем в полете нажмите на 1, 2 или 3 (зависит от слота), после этого ЛКМ, парашют откроется.
:?:.поход::Изменить походу и эмоции лица можно в  F2 - Настройки - Главное.
:?:.багаж::Чтобы вылезти из багажника нажмите на "E", багажник должен быть открытым.
:?:.нал::Чтобы оплатить налоги на дом необходимо открыть приложение "Мой дом" в планшете.
:?:.дил::Диллеры проходят два раза в день, в 10:45 и 18:45.
:?:.цех::Захват цехов проводит два раза в день, в 14:45 и 22:45.
:?:.вес::Проверьте возможно вы просто перегружены, Вес отображается в правом верхнем углу инвентаря, он не должен привышать 30 кг.
:?:.ключ::Вам нужно приехать на ключ и вызвать там своей автомобиль нажав E на синей метке. (Ключ - гаечный ключ на карте, называется автосервис)
:?:.дмк::Дефибриллятор МК2 никакого функционала не даёт, он аналогичен обычному дефибриллятору.
:?:.адр::Адреналин поднимает игрока в 2 раза быстрее, чем эпинефрин.


; Ответы "Пропуск"
:?:.арм::Сыграть в платный армрестлинг Вы можете напротив банды The Families в гетто либо же напротив Шерифского департамента в Палето-Бей.
:?:.бин::Чтобы посмотреть в бинокль нужно взять его в руки, далее нажать ЛКМ или ПКМ (зависит от бинда) чтобы начать смотреть, далее колесико вверх/вниз чтобы приближать или отдалять. Купить его можно на рынке у охотника или на маркетплейсе.
:?:.лифт::Покататься на лифте вы можете в следующих здания Goverment/FIB/Weazel News.
:?:.лестница::Чтобы выполнить это задание вам нужно спуститься по лестнице, а не по ступенька, лестницы находиться на стройках.
:?:.тест::Чтобы провести тест драйв, нужно зайди в здание и найти зону в которой можно открыть меню через Е и уже через это меню можно провести тест драйв.
:?:.пейдей::Надо либо уволится с работы, чтобы получать пособие, либо устроится в гос фракцию, чтобы получать зарплату. В противном случае задание считатся не будет.
:?:.церк::Чтобы сменить тематику в церкви, вам нужно приехать в любую церковь, далее найти NPC за столом, подойти к нему и нажать E - Сменить тематику церкви.
:?:.форт::Сыграть на фортепиано можно на территории здания Мэрии.
:?:.бин::Чтобы посмотреть в бинокль нужно взять его в руки, далее нажать ЛКМ или ПКМ (зависит от бинда) чтобы начать смотреть, далее колесико вверх/вниз чтобы приближать или отдалять.
:?:.стрип::Зайдите в стриптиз-клуб, внутри клуба отыщите специальную комнату для приватных танцев, потом подойдите к дивану в этой комнате и нажмите клавишу "E" (по умолчанию) для взаимодействия.
:?:.лестница::Чтобы выполнить это задание вам нужно спуститься по лестнице, а не по ступенька, лестницы находиться на стройках.
:?:.гриль::Что бы пользоваться грилем, вам нужно его поставить и нажать G Пожарить. Купить его можно в любом 24/7 или маркетплейсе
:?:.вбп::Бронзовый пропуск открывает доступ к премиум наградам до 50 уровня, серебрянный до 10 уровня, золотой до 150 уровня. Опыт дает только королевский старт.


; Ответы "Скиллы"
:?:.вынос::Выносливость - навык выносливости повышается от подвижного образа жизни. Чем больше ты бегаешь, тем быстрее повышается навык. При низком навыке, персонаж не может прыгнуть 2 раза и падает. Соответственно повышение навыка влияет на длительность беспрерывного бега и количество прыжков, максимум на последнем уровне - 2.
:?:.сила::Сила - навык силы повышается от физических нагрузок. Чем больше ты занимаешься в качалке (иконка гантели), тем быстрее повышается навык. От прокачки увеличивается сопротивление к урону от падения.
:?:.дых::Дыхание - навык дыхания повышается от длительного нахождения под водой. Чем больше ты плаваешь, тем быстрее повышается навык. Соответственно повышение навыка влияет на длительность беспрерывного плавания под водой.
:?:.вожден::Вождение - навык вождения повышается от времени, проведенного за рулем автомобиля. Чем больше ты водишь транспорт, тем быстрее повышается навык. От прокачки увеличивается управляемость транспортным средоством.
:?:.полет::Полет - навык пилотирования повышается от времени, проведенного за воздушным транспортом. Чем больше ты летаешь на самолете или вертолете, тем быстрее повышается навык. Также навык можно повысив пройдя курсы в летной школе. Пройти их можно 1 раз в 24 часа, увелчение навыка от 1 занятия - 10, стоимость одного занятия - 2 000$. От прокачки навыка увеличивается стабильность полета и управляемость воздушным транспортом.
:?:.скрытн::Скрытность - навык скрытности повышается от количества успешных уходов от погони (понижений уровня розыска). Чем чаще ты скрываешься от полиции, тем быстрее повышается навык. Ни на что на влияет
:?:.стрельба::Стрельба - навык стрельбы повышается от времени, проведенного в перестрелках, либо тренировках. Чем лучше ты стреляешь и попадаешь, тем быстрее повышается навык. Рекомендуем тренироваться в специально отведенных для того местах, тире в оружейном магазине. От прокачки навыка увеличивается скорость перезарядки и перекатов, кучность стрельбы.


; Ответы "MCL"
:?:.зон::/cb Ваша зона началась в , у вас есть 5 минут чтобы поменять зону{left 40}
:?:.лок::/cb Ваша локация началась в , у вас есть 2 минуты чтобы поменять локацию{left 44}
:?:/pjy::/cb Ваша зона началась в , у вас есть 5 минут чтобы поменять зону{left 40}
:?:/kjr::/cb Ваша локация началась в , у вас есть 2 минуты чтобы поменять локацию{left 44}
:?:.мклтп::Здравствуйте, сегодня я с вами, перед телепортом выложите запрещённые предметы, после телепорта не разбегайтесь и ожидайте пока вас проверят.


; Ответы "Вики/работы"
:?:.камера::Информацию о механике поломки камеры вы можете найти тут https://wiki.majestic-rp.ru/post/unichtozhenie-kamer
:?:.маркет::Информацию о механике маркетплейса вы можете найти тут https://wiki.majestic-rp.ru/post/marketplejs
:?:.даль::Информацию о работе дальнобойщика вы можете найти тут https://wiki.majestic-rp.ru/post/dalnobojshik
:?:.рыбак::Информацию о механике рыбалки вы можете найти тут https://wiki.majestic-rp.ru/post/rybak
:?:.гриб::Информацию о работе грибника вы можете найти тут https://wiki.majestic-rp.ru/post/gribnik
:?:.работы::Информацию о работах на проекте вы можете найти тут https://wiki.majestic-rp.ru
:?:.метал::Металлоискатель становится активным как только Вы берете его в руки. Когда он найдет сокровища, то будут происходить визуальные и звуковые оповещения. От зеленого цвета, до красного. Места расположения сокровищ: пляжи и архипелаги.
:?:.работа::На сервере есть квесты на работах у НПС, такие как Шахта/Рыбалка/Лесоруб/Дальнобойщик/Мусоровоз, Вам нужно взять квесть у них. У бота на работе будет кнопка "Я могу чем-то помочь". Вы на неё жмёте и у вас откроется квест, который выполнить нужно (на Ф6 можно посмотреть). Выполняете этот квест и Вам засчитывает задание.
:?:.груп::Чтобы вместе работать на кооперативной работе вам необходимо пригались игроков через приложение "Группа" в телефоне.


; Наказания
:?:.фофшд::/ajail
:?:.гтофшд::/unjail
; NRD
:?:.нрд::/ajail 15 nonRP Drive{Left 15}
:?:.нрд30::/ajail 30 nonRP Drive{Left 15}
:?:.нрд45::/ajail 45 nonRP Drive{Left 15}
:?:.нрд60::/ajail 60 nonRP Drive{Left 15}
:?:.нрд90::/ajail 90 nonRP Drive{Left 15}
; Nrp
:?:.нрп::/ajail 15 nonRP Поведение{Left 19}
:?:.нрп30::/ajail 30 nonRP Поведение{Left 19}
:?:.нрп45::/ajail 45 nonRP Поведение{Left 19}
:?:.нрп60::/ajail 60 nonRP Поведение{Left 19}
:?:.нрп90::/ajail 90 nonRP Поведение{Left 19}
:?:.нрпп::/ajail 15 nonRP Проникновение{Left 23}
; DB
:?:.дб::/ajail 30 DB{Left 6}
:?:.дб45::/ajail 45 DB{Left 6}
:?:.дб60::/ajail 60 DB{Left 6}
:?:.дб75::/ajail 75 DB{Left 6}
:?:.дб90::/ajail 90 DB{Left 6}
; DM
:?:.дм::/gunban 5 DM{Left 5}
:?:.дм120::/ajail  120 DM{Left 7}
; PG
:?:.пг::/ajail 35 PG{Left 6}
:?:.пг60::/ajail 60 PG{Left 6}
:?:.пг75::/ajail 75 PG{Left 6}
:?:.пг90::/ajail 90 PG{Left 6}
; OOC Оск
:?:.оосо::/ajail 15 OOC Оскорбление.{Left 20}
; SP
:?:.сп::/mute 30 SP in GZ{Left 12}
:?:.ооси::/mute 90 OOC in IC{Left 13}
:?:.сп60::/mute 60 SP in GZ{Left 12}
:?:.тон::/mute 30 ПО для изменения тональности голоса.{Left 40}
; ВЗА
:?:.вза18::/ajail 35 1.8 ВЗА{Left 11}
:?:.вза19::/ajail 45 1.9 ВЗА{Left 11}
:?:.вза31::/ajail 90 3.1 ВЗА{Left 11}
:?:.вза35::/ajail 35 3.5 ВЗА{Left 11}
; ППП
:?:.ппп16::/ajail 90 1.6 ППП{Left 11}
; Ник внешка
:?:.ник::/ajail 720 Смените Имя_Фамилия согласно правилам сервера{Left 50}
:?:.пол::/ajail 720 Смените внешность согласно правилам сервера{Left 48}
; Crime zz
:?:.кзз::/ajail 15 Crime in GZ{Left 15}
; Разное
:?:.читс::/hardban 9999 Cheat{Left 11}
:?:.уход::/warn Уход от RP{Left 11}

:?:.снег::
SendMessage, 0x50,, 0x4190419,, A
sleep 200
Sendinput, /setweatherlocal extrasunny{enter}
sleep 600
Sendinput, {t}
sleep 200
Sendinput, /togglesnow 0{enter}
return

Reload:
reload
return

^F9::reload
^F10::Exitapp

:?:.ку::
SendMessage, 0x50,, 0x4190419,, A
SendInput, Приветствую, сейчас я займусь Вашим обращением. Ожидайте.
SendInput, {Enter}
{
counter++
GoSub, UpdateCounter
Clipboard :=
}
Return

:?:/re::
SendMessage, 0x50,, 0x4190419,, A
SendInput, Приветствую, сейчас я займусь Вашим обращением. Ожидайте.
SendInput, {Enter}
{
counter++
GoSub, UpdateCounter
Clipboard :=
}
Return


:?:.да::
SendMessage, 0x50,, 0x4190419,, A
SendInput, Приветствую, да.
SendInput, {Enter}
{
counter++
GoSub, UpdateCounter
Clipboard :=
}
Return

:?:.нет::
SendMessage, 0x50,, 0x4190419,, A
SendInput, Приветствую, нет.
SendInput, {Enter}
{
counter++
GoSub, UpdateCounter
Clipboard :=
}
Return

Close:
exitapp

Hide:
Gui, Main: Hide
return

Show:
Gui, Main: Show
return

guiclose2:
gui, Main:hide

guiclose:
Gui, Answers:Destroy
return

guiclose3:
Gui, Commandlist:Destroy
return

guiclose4:
Gui, Usefull:Destroy
return