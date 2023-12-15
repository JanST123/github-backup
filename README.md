# Simple github backup script

This backup script back ups your personal github repositories via git+ssh including also the private repositories.
It uses a combination of a shell script and a PHP script. PHP is used as I only have a very basic set of shell commands available at my webhoster "Netcup". So this script also works on cheap webhosting packages.


## Requirements
* curl
* git
* PHP (5.x should be enough)
* tar 
* gzip

## Usage
* Create a **personal access token** in your GitHub `Settings->Developer Settings` with `read:packages` scope
* Run the script via cronjob like so: `GITHUB_AUTH_TOKEN=<YOUR TOKEN> cd github_backup && ./backup.sh  > log.log 2>&1`

## Result
The script will mirror all your repositories to a local temporary directory and finally tgz it.

**Attention** the script contains a line to remove all existing `.tgz` files first, as I only wanted one backup. As the filename contains the date you could remove this line and have one backup per day. But you will want to implement a cleanup as each backup contains a full copy of all repos. 
