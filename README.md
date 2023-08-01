# Toast notification script voor Digipolis
Het script op deze pagina is een PowerShell-script dat je kunt gebruiken om toastmeldingen te maken en weer te geven op Windows 10 en Windows Server 2019. Toastmeldingen zijn kleine pop-upberichten die in de rechterbenedenhoek van het scherm verschijnen. Ze kunnen informatie, waarschuwingen, herinneringen of acties bevatten.

Met het script kun je verschillende opties configureren voor de toastmeldingen, zoals de titel, de tekst, de afbeeldingen, de knoppen, de geluiden en de vervaldatum. Je kunt het script ook gebruiken voor verschillende doeleinden, zoals:

- UpgradeOS: om gebruikers te informeren over nieuwe beschikbare Windows-versies en hen aan te moedigen om zelf een upgrade uit te voeren.
- PendingReboot: om gebruikers te herinneren aan een hangende herstart en de uptime van de computer te controleren.
- ADPasswordExpiration: om gebruikers te waarschuwen dat hun Active Directory-wachtwoord binnenkort verloopt en hen te vragen het te wijzigen.
- CustomActions: om aangepaste acties of protocollen uit te voeren vanuit de toastmelding, zoals het starten van een taaksequentie, het installeren van een applicatie of het openen van een webpagina.

## Config-Toast XML
In deze sectie vind je alle configuratiegegevens die nodig zijn om de toast notificatie te laten zien. Op de eerste plek vind je bijvoorbeeld de afbeelding die als logo gebruikt wordt. Daaronder vind je de afbeelding die boven de melding komt te staan.

    <Option Name="LogoImageName" Value="https://raw.githubusercontent.com/appieatcheops/ToastNotificationScript2.3.0/master/Images/Logo-Digipolis-RGB.png" />  <!-- File name of the image shown as logo in the toast notoification  -->
    <Option Name="HeroImageName" Value="https://raw.githubusercontent.com/appieatcheops/ToastNotificationScript2.3.0/master/Images/digipolis-illustratie-support_02-blauw-pos-rgb%402x.png" /> <!-- File name of the image shown in the top of the toast notification -->


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

