#!/bin/bash

# Take input from users if environment variable is not present.

if [ $LINODEKEY ]
then
  echo "Linode Key has been taken from environment variable !!"
else
  read -p "Enter your LINODEKEY: " LINODEKEY
  echo $LINODEKEY 
fi

# =================== Linode Datacenter API Output ================

# {
#   "ERRORARRAY": [],
#   "DATA": [
#     {
#       "LOCATION": "Dallas, TX, USA",
#       "DATACENTERID": 2,
#       "ABBR": "dallas"
#     },
#     {
#       "LOCATION": "Fremont, CA, USA",
#       "DATACENTERID": 3,
#       "ABBR": "fremont"
#     },
#     {
#       "LOCATION": "Atlanta, GA, USA",
#       "DATACENTERID": 4,
#       "ABBR": "atlanta"
#     },
#     {
#       "LOCATION": "Newark, NJ, USA",
#       "DATACENTERID": 6,
#       "ABBR": "newark"
#     },
#     {
#       "LOCATION": "London, England, UK",
#       "DATACENTERID": 7,
#       "ABBR": "london"
#     },
#     {
#       "LOCATION": "Tokyo, JP",
#       "DATACENTERID": 8,
#       "ABBR": "tokyo"
#     },
#     {
#       "LOCATION": "Singapore, SG",
#       "DATACENTERID": 9,
#       "ABBR": "singapore"
#     },
#     {
#       "LOCATION": "Frankfurt, DE",
#       "DATACENTERID": 10,
#       "ABBR": "frankfurt"
#     }
#   ],
#   "ACTION": "avail.datacenters"
# }
# =================== Linode Datacenter API Ends ================

# Datacenter ID's are been mapped as per the api results
dallas=2
fremont=4
newark=6
london=7
tokyo=8
singapore=9
frankfurt=10

echo "1. Dallas"
echo "2. Fremont"
echo "3. Newark"
echo "4. London"
echo "5. Tokyo"
echo "6. Singapore"
echo "7. Frankfurt"

read -p "Select Datacenter from above mentioned serial number : " datacenter_serial_number

case $datacenter_serial_number in
  1)
    echo "You have selected Dallas Datacenter"
    DATACENTERID=$dallas
    ;;
  2)
    echo "You have selected Fremont Datacenter"
    DATACENTERID=$fremont
    ;;
  3)
    echo "You have selected Newark Datacenter"
    DATACENTERID=$newark
    ;;
  4)
    echo "You have selected London Datacenter"
    DATACENTERID=$london
    ;;
  5)
    echo "You have selected Tokyo Datacenter"
    DATACENTERID=$tokyo
    ;;
  6)
    echo "You have selected Singapore Datacenter"
    DATACENTERID=$singapore
    ;;
  7)
    echo "You have selected Frankfurt Datacenter"
    DATACENTERID=$frankfurt
    ;;
esac
# =================== Linode Plan API output ================
# {
#   "ERRORARRAY": [],
#   "DATA": [
#     {
#       "CORES": 1,
#       "PRICE": 10,
#       "RAM": 2048,
#       "XFER": 2000,
#       "PLANID": 1,
#       "LABEL": "Linode 2048",
#       "AVAIL": {
#         "2": 500,
#         "3": 500,
#         "4": 500,
#         "6": 500,
#         "7": 500,
#         "8": 500,
#         "9": 500,
#         "10": 500
#       },
#       "DISK": 24,
#       "HOURLY": 0.015
#     },
#     {
#       "CORES": 2,
#       "PRICE": 20,
#       "RAM": 4096,
#       "XFER": 3000,
#       "PLANID": 2,
#       "LABEL": "Linode 4096",
#       "AVAIL": {
#         "2": 500,
#         "3": 500,
#         "4": 500,
#         "6": 500,
#         "7": 500,
#         "8": 500,
#         "9": 500,
#         "10": 500
#       },
#       "DISK": 48,
#       "HOURLY": 0.03
#     },
#     {
#       "CORES": 4,
#       "PRICE": 40,
#       "RAM": 8192,
#       "XFER": 4000,
#       "PLANID": 4,
#       "LABEL": "Linode 8192",
#       "AVAIL": {
#         "2": 500,
#         "3": 500,
#         "4": 500,
#         "6": 500,
#         "7": 500,
#         "8": 500,
#         "9": 500,
#         "10": 500
#       },
#       "DISK": 96,
#       "HOURLY": 0.06
#     },
#     {
#       "CORES": 6,
#       "PRICE": 80,
#       "RAM": 12288,
#       "XFER": 8000,
#       "PLANID": 6,
#       "LABEL": "Linode 12288",
#       "AVAIL": {
#         "2": 500,
#         "3": 500,
#         "4": 500,
#         "6": 500,
#         "7": 500,
#         "8": 500,
#         "9": 500,
#         "10": 500
#       },
#       "DISK": 192,
#       "HOURLY": 0.12
#     },
#     {
#       "CORES": 8,
#       "PRICE": 160,
#       "RAM": 24576,
#       "XFER": 16000,
#       "PLANID": 7,
#       "LABEL": "Linode 24576",
#       "AVAIL": {
#         "2": 500,
#         "3": 500,
#         "4": 500,
#         "6": 500,
#         "7": 500,
#         "8": 500,
#         "9": 500,
#         "10": 500
#       },
#       "DISK": 384,
#       "HOURLY": 0.24
#     },
#     {
#       "CORES": 12,
#       "PRICE": 320,
#       "RAM": 49152,
#       "XFER": 20000,
#       "PLANID": 8,
#       "LABEL": "Linode 49152",
#       "AVAIL": {
#         "2": 500,
#         "3": 500,
#         "4": 500,
#         "6": 500,
#         "7": 500,
#         "8": 500,
#         "9": 500,
#         "10": 500
#       },
#       "DISK": 768,
#       "HOURLY": 0.48
#     },
#     {
#       "CORES": 16,
#       "PRICE": 480,
#       "RAM": 65536,
#       "XFER": 20000,
#       "PLANID": 9,
#       "LABEL": "Linode 65536",
#       "AVAIL": {
#         "2": 500,
#         "3": 500,
#         "4": 500,
#         "6": 500,
#         "7": 500,
#         "8": 500,
#         "9": 500,
#         "10": 500
#       },
#       "DISK": 1152,
#       "HOURLY": 0.72
#     },
#     {
#       "CORES": 20,
#       "PRICE": 640,
#       "RAM": 81920,
#       "XFER": 20000,
#       "PLANID": 10,
#       "LABEL": "Linode 81920",
#       "AVAIL": {
#         "2": 500,
#         "3": 500,
#         "4": 500,
#         "6": 500,
#         "7": 500,
#         "8": 500,
#         "9": 500,
#         "10": 500
#       },
#       "DISK": 1536,
#       "HOURLY": 0.96
#     },
#     {
#       "CORES": 20,
#       "PRICE": 960,
#       "RAM": 122880,
#       "XFER": 20000,
#       "PLANID": 12,
#       "LABEL": "Linode 122880",
#       "AVAIL": {
#         "2": 500,
#         "3": 500,
#         "4": 500,
#         "6": 500,
#         "7": 500,
#         "8": 500,
#         "9": 500,
#         "10": 500
#       },
#       "DISK": 1920,
#       "HOURLY": 1.44
#     }
#   ],
#   "ACTION": "avail.LinodePlans"
# }
# =================== Linode Plan API Ends ================

# Plan ID's are been mapped as per the api results
Linode2048=1
Linode4096=2
Linode8192=4
Linode12288=6
Linode24576=7
Linode49152=8
Linode65536=9
Linode81920=10
Linode122880=12

echo "1. Linode2048"
echo "2. Linode4096"
echo "3. Linode8192"
echo "4. Linode12288"
echo "5. Linode24576"
echo "6. Linode49152"
echo "7. Linode65536"
echo "8. Linode81920"
echo "9. Linode122880"

read -p "Select Datacenter from above mentioned serial number : " plan_serial_number

case $plan_serial_number in
  1)
    echo "You have selected 2 GB Linode Plan"
    PLANID=$Linode2048
    ;;
  2)
    echo "You have selected 4 GB Linode Plan"
    PLANID=$Linode4096
    ;;
  3)
    echo "You have selected 8 GB Linode Plan"
    PLANID=$Linode8192
    ;;
  4)
    echo "You have selected 16 GB Linode Plan"
    PLANID=$Linode12288
    ;;
  5)
    echo "You have selected 24 GB Linode Plan"
    PLANID=$Linode24576
    ;;
  6)
    echo "You have selected 48 GB Linode Plan"
    PLANID=$Linode49152
    ;;
  7)
    echo "You have selected 64 GB Linode Plan"
    PLANID=$Linode65536
    ;;
  8)
    echo "You have selected 80 GB Linode Plan"
    PLANID=$Linode81920
    ;;
  9)
    echo "You have selected 120 GB Linode Plan"
    PLANID=$Linode122880
    ;;
esac

# Create linode box via api

# https://api.linode.com/?api_key=iqX5qYRFOfWBYnUat1Hx7Fe5x8f9Ogp64kLyyDWuxpA0LzynfcZ8yh9TXAiPArpU&api_action=linode.create&DatacenterID=9&PlanID=1

# Need to be implemented

# Abort if some error occurs
# http://stackoverflow.com/questions/2870992/automatic-exit-from-bash-shell-script-on-error

url="https://api.linode.com/?api_key=$LINODEKEY&api_action=linode.create&DatacenterID=$DATACENTERID&PlanID=$PLANID"
header="Content-Type: application/json"
echo $url

content=$(curl -H "${header}" -XGET "${url}")
echo $content
if [ $content ] 
then
  error=`python -c "import sys, json; print json.loads(json.dumps($content))['ERRORARRAY']"`
  linodeid=`python -c "import sys, json; print json.loads(json.dumps($content))['DATA']"`

  echo $error
  echo ${#error[@]}
  echo ${#linodeid[@]}

  # Check for error message, if any about and log the error message.
  # http://stackoverflow.com/questions/17368067/length-of-string-in-bash
  # Find length
  if [[ ${#errors[@]} -eq 0 ]]
  then
    ERROR=`python -c "import sys, json; print json.loads(json.dumps($content))['ERRORARRAY'][0]['ERRORMESSAGE']"`
    exit 1
  else
    LINODEID=`python -c "import sys, json; print json.load(sys.stdin)['DATA']['LinodeID']"`
  fi
fi
# echo $ERROR
# echo $LINODEID