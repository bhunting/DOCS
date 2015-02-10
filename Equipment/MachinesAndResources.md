# Machines And Resources

This document describes machines (virtual and physical) and related resources in use for development.

TODO: merge AUC-relevant info from http://svusftceq/trac/sw/wiki/AucSwMachines

## Shared Sw Team Data Folder

The Sw Team shared data folder may be found at:

* `\\BACH\\AUCNetShare`

**NOTE** that the `BACH` computer is in the AUC Sw Team build area.

## Accounts

### Accounts on GitHub

* **jenkins** -- **Passw*d:** _sw-dept-standard_ ... For Jenkins continuous integration server
 

## IP Addresses

The following **static IP addresses** are allocated from IT for development as of 20-Jan-2015 (more are available by request):

* **10.22.72.220** -- **"debauchery"** VM, Debian x86, (running within Bach)
* **10.22.72.221** -- 
* **10.22.72.222** -- 
* **10.22.72.223** -- Charley's **"debaucherycsb"** copy (Debian x86)
* **10.22.72.224** -- Dennis's **"debauchery"** copy (Debian x86)
* **10.22.72.225** -- Kyle's **"debauchery"** copy (Debian x86)
* **10.22.72.226** -- Brad's **"debauchery"** copy (Debian x86)
* **10.22.72.227** -- **AUC Gui Dev/Test** _(AUC farm, inside)_ _(Login: aucuser, P*wd: aucuser, su: sw-dept-standard)_ [Atom board running Debian](AtomPrototypeMachines.md) _(assigned 27-Jan-2015)_
* **10.22.72.228** -- **AUC Gui DEMO** _(AUC farm, facing out)_ _(Login: aucuser, P*wd: aucuser, su: sw-dept-standard)_ [Atom board running Debian](AtomPrototypeMachines.md) _(assigned 27-Jan-2015)_
* **10.22.72.229** -- **AUC Fuge-Control Dev/Test** _(by Kyle)_ _(Login: aucuser, P*wd: aucuser, su: sw-dept-standard)_ [Atom board running Debian](AtomPrototypeMachines.md) _(assigned 27-Jan-2015)_

## Continuous Integration Tools

Jenkins is accessible via webbrowser at `http://10.22.72.220:8080/`.

## "Generic" Setups

The following "generic" configurations exist:

* **"Atom"** -- Single-Core Atom x86, Debian 32-bit, HEADLESS (no desktop) [Intel Atom N270](http://www.intel.com/content/www/us/en/intelligent-systems/navy-pier/embedded-intel-atom-n270-with-mobile-intel-945gse-express-chipset.html)
  * Intended "target" embedded control hardware for AUC
  * Used for development, integration, GUI testing
  * Relevant System Configuration:
    * **Login username:**  `dev`
    * **Login p*wd:**  _SW-dept-default_
    * File System:
      * `/home/dev/auc/0.1/.` _-- installed AUC files_
      * `/opt/.` _-- tools, soft-linked to `dataA`_

* **"Debauchery"** -- Debian 32-bit x86 Virtual Machine (VM), multi-core
  * Intended for development in a Virtual Machine (VM) for products that target the **Atom** system
  * Relevant System Configuration:
    * **Login username:**  `dev`
    * **Login p*wd:**  _SW-dept-default_
    * File System:
      * `/opt/.` _-- tools, soft-linked to `dataA`_
      * `/auc/0.1/.` _-- build products, including to-be-installed to Atom, soft-linked to `dataA/auc/.`_
      * `/src/.` _-- source for AUC, soft-linked to `dataA/src/.`_

## Actual Equipment/Computers

* **Atom** (for development) _(AUC farm, inside cube)_
* **Atom** (for GUI demo) _(AUC farm, facing out)_
* **Debauchery** (for VM development) _(on each developer's laptop)_
 
