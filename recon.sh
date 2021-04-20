domain=$1

domain_enum(){

mkdir -p $domain $domain/sources  $domain

subfinder -d $domain -o output.txt
assetfinder —subs-only $domain | tee $domain
amass enum -passive -d $domain -o passive.txt
}
domain_enum

httprobe(){
  $cat passive.txt | httprobe --prefer-https
}
httprobe
  

    

