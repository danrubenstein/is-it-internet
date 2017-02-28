## isit{x}.com

Inspired by [Is It Christmas](https://isitchristmas.com), this script takes common words found in the English language, found [here](https://github.com/dwyl/english-words), and runs the command 

```
#var is the word in question
ping -o -q -t 2 isit$var.com
```

I originally ran this script on February 28, 2017. AWS has been down for some time today, so it's not clear that this original run was super representative. This generates an output file output.csv, which contains the word, and whether or not the ping was successful.

#### Running 
```
chmod 755 script.sh
./script.sh
```

#### Analysis 
More to come, I hope


