# BIC DBF to database
Code used to process DBF files from Central Bank of Russia, containing Bank Codes, and upload them to database. Obsolete, since CBR moved to XML format. Sharing for prosperity.

# What it does
It downloads the .zip files from https://cbr.ru, opens then using DBA extension, converts the data in them to PHP arrays, sanitizes them and uploads to the database, where you can use the data as you see fit.

# How to use
First you need to have the database connection open, using https://github.com/Simbiat/database.
Then you need to initiate an object
```php
$bic = (new \bicDBF\bicDBF);
```
By default it assumes, that all your tables will be using prefix `bic__`, but it can be replaced, if you want to:
```php
$bic = (new \bicDBF\bicDBF('prefix'));
```
If you are only preparing the environment you will need to run installer, that will run `install.sql` file (while applying your prefix, so beware if you want to run that .sql directly):
```php
$bic->install();
```
Once the tables are created, you need to run the updater:
```
$bic->dbUpdate($path, '31122018');
```
This function will do all the dirty work explained above. It expect you to provide the path where the .zip will be downloaded(`$path`) and optional date as string in format `dmY`. If date is not provided, the function will try using current date, but currently it will fail to download the file, since they are not updated anymore. `31122018` is the latest file currently available on https://cbr.ru.

# Getting data
Obviously, you would want ability to get data after it's uploaded to database, so there are 3 functions, that can help you with that.
```php
$bic->Search('something');
```
This one will allow you to search the main table (`list`) for NEWNUM (this is how CBR calls BICs in this structure), RKC, full name and registration number. Using standard `LIKE` in search here, because full text search did not provide tangible performance difference, considering the small size of the database.
```php
$bic->Statistics();
```
This one will return an array with number of active BICs, number of deleted BICs, as well as last `X` of changed and deleted BICs. By default, `X` is 10, but you can pass whatever other number you want to adjust.
```php
$bic->getCurrent('VKEY');
```
This one gets all the data available about the BIC, including all references to related banks: branches, RKC, successors and predecessors. `VKEY` is mandatory and references to weird primary keys that CBR uses (like `392!EOmE`, `Fyg(wdtf` or `Yw7y9=6+`).