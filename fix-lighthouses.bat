@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This script was created to get your lighthouses back into a state where they're both on or off ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:::::: config area ::::::
set lighthouseMACAddressList=FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED
::::::::::::::::::::::::

echo Trying to get lighthouses back into the same state. Going to turn them off, then on, then off. 

lighthouse-v2-manager.exe off %lighthouseMACAddressList%
lighthouse-v2-manager.exe off %lighthouseMACAddressList%
lighthouse-v2-manager.exe on %lighthouseMACAddressList%
lighthouse-v2-manager.exe on %lighthouseMACAddressList%
lighthouse-v2-manager.exe off %lighthouseMACAddressList%
