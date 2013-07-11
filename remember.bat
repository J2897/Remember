:: Released under the GNU General Public License version 3 by J2897.

@echo OFF
set NEW_FOLDER=0

:start
if not exist %USERPROFILE%\Desktop\Memory\%NEW_FOLDER% (goto :not_exist)
set /a NEW_FOLDER=NEW_FOLDER+1
goto :start

:not_exist
md %USERPROFILE%\Desktop\Memory\%NEW_FOLDER%

REM Move all files, excluding some, to the new folder...
echo Moving files . . .
for %%a in (%USERPROFILE%\Desktop\*) do (
	if not "%%~na"=="GitHub" (
		if not "%%~na"=="ExifTool" (
			if not "%%~na"=="md5sums" (
				if not "%%~na"=="Update Iron" (
					if not "%%~na"=="TeamViewer" (
						if not "%%~na"=="WinMerge" (
							if not "%%~na"=="Start Tor Browser" (
								move "%%~fa" "%USERPROFILE%\Desktop\Memory\%NEW_FOLDER%\%%~nxa"
							)
						)
					)
				)
			)
		)
	)
)

REM Move all folders, excluding one, to the new folder...
echo Moving folders . . .
for /d %%a in (%USERPROFILE%\Desktop\*) do (
	if not "%%~na"=="Memory" (
		move "%%~fa" "%USERPROFILE%\Desktop\Memory\%NEW_FOLDER%\%%~nxa"
	)
)
