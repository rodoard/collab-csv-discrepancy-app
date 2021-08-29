# Implements (https://gist.github.com/sp2410/dbd287bc254c9a3f48248500c80d3921)
### A rails application with an interface that allows uploading multiple csv files and test for discrepancies

Input: 

CSV files each with three columns: 
Account Email, YouTube Channel, Subscriber Count.

Output:

The app, outputs a list of account emails with a discrepancy.

If a concern is provided as a parameter, only output the discrepancies which are related to that data.

If no concern is provided, outputs all the unique discrepancies

## Setup
To run the app, clone the repo and cd into the directory

```
$ cd collab-csv-discrepancy-app
$ bundle
$ rails test
$ rails s
```
