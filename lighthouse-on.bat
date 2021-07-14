@echo off
call .\config.bat

echo MixedVR-Manager is turning lighthouses v%lighthouseVersion% %desiredLighthouseState%...
if "%lighthouseVersion%" == "2.0" (
	FOR %%A IN (%lighthouseMACAddressList%) DO (
		start /B ./bin/lighthouse-keeper.exe on 2 %VAR1%%%A
	)
)
if "%lighthouseVersion%" == "1.0" (
	FOR %%A IN (%lighthouseMACAddressList%) DO (
		start /B ./bin/lighthouse-keeper.exe on 1 %VAR1%%%A
	)
)

exit