# Toast notification script voor Digipolis
## Config-Toast XML
In deze sectie vind je alle configuratiegegevens die nodig zijn om de toast notificatie te laten zien. Op de eerste plek vind je bijvoorbeeld de afbeelding die als logo gebruikt wordt. Daaronder vind je de afbeelding die boven de melding komt te staan.

    <Option Name="LogoImageName" Value="https://raw.githubusercontent.com/appieatcheops/ToastNotificationScript2.3.0/master/Images/Logo-Digipolis-RGB.png" />  <!-- File name of the image shown as logo in the toast notoification  -->
    <Option Name="HeroImageName" Value="https://raw.githubusercontent.com/appieatcheops/ToastNotificationScript2.3.0/master/Images/digipolis-illustratie-support_02-blauw-pos-rgb%402x.png" /> <!-- File name of the image shown in the top of the toast notification -->

De tekst om 

*Voorbeeld*

![Voorbeeld notificatie](/Images/screenshot_voorbeeld.png)

## Intune Proactive Remidiation
Om te kunnen zien welke apparaten voldoen aan de voorwaarden die we opleggen om het script uit te voeren, maken we gebruik van Intune Proactive Remidiation. Dit kun je vergelijken met Task Scheduler in Windows. Het werkt door middel van een detectiescript, waarbij afhankelijk van de uitkomst het remidation script wordt uitgevoerd. Bijvoorbeeld:

    if ($uptime.Hours -gt 1) {
    Write-Output "Uptime is more than 1 hour"
    exit 1 
    }else{
    exit 0
    }

Hierbij kijken we hoe lang de computer aanstaat en geven we een foutmelding als deze langer dan 1 uur aanstaat. 1 betekent dat er een ‘fout’ is, wat betekent dat het remidation script moet worden uitgevoerd. 0 betekent dat alles OK is en er wordt niets uitgevoerd.

