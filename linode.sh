#!/bin/bash

# Take input from users if environment variable is not present.

if [ $LINODEKEY ]
then
  echo "Linode Key has been taken from environment variable !!"
else
  read -p "Enter your Linode Key: " LINODEKEY
  echo $LINODEKEY
fi

read -p "Name your box: "  LABEL

if [ $ROOTPWD ]
then
  echo "Root password has been take from environment variable !!"
else
  read -p "Enter your Root Password: " ROOTPWD
  echo $ROOTPWD
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
    DISKSPACE=24320
    SWAPSIZE=256
    ;;
  2)
    echo "You have selected 4 GB Linode Plan"
    PLANID=$Linode4096
    DISKSPACE=48896
    SWAPSIZE=256
    ;;
  3)
    echo "You have selected 8 GB Linode Plan"
    PLANID=$Linode8192
    DISKSPACE=11487
    SWAPSIZE=256
    ;;
  4)
    echo "You have selected 16 GB Linode Plan"
    PLANID=$Linode12288
    DISKSPACE=196352
    SWAPSIZE=256
    ;;
  5)
    echo "You have selected 24 GB Linode Plan"
    PLANID=$Linode24576
    DISKSPACE=392960
    SWAPSIZE=256
    ;;
  # Need to use complete harddisk once we have upgrade more than 24 GB plan, check available space after allocating swap memory and update here.  Now it will work fine but harddisk space will not be utilized 100%.
  6)
    echo "You have selected 48 GB Linode Plan"
    PLANID=$Linode49152
    DISKSPACE=392960
    SWAPSIZE=256
    ;;
  7)
    echo "You have selected 64 GB Linode Plan"
    PLANID=$Linode65536
    DISKSPACE=392960
    SWAPSIZE=256
    ;;
  8)
    echo "You have selected 80 GB Linode Plan"
    PLANID=$Linode81920
    DISKSPACE=392960
    SWAPSIZE=256
    ;;
  9)
    echo "You have selected 120 GB Linode Plan"
    PLANID=$Linode122880
    DISKSPACE=392960
    SWAPSIZE=256
    ;;
esac

# =================== Linode Distrubtion API output ================
# {
#   "ERRORARRAY": [],
#   "DATA": [
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 148,
#       "IS64BIT": 1,
#       "LABEL": "Arch 2016.09.03",
#       "MINIMAGESIZE": 1639,
#       "CREATE_DT": "2016-06-13 16:31:34.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 129,
#       "IS64BIT": 1,
#       "LABEL": "CentOS 7",
#       "MINIMAGESIZE": 800,
#       "CREATE_DT": "2014-07-08 10:07:21.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 130,
#       "IS64BIT": 1,
#       "LABEL": "Debian 7",
#       "MINIMAGESIZE": 600,
#       "CREATE_DT": "2014-09-24 13:59:32.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 140,
#       "IS64BIT": 1,
#       "LABEL": "Debian 8",
#       "MINIMAGESIZE": 1024,
#       "CREATE_DT": "2015-04-27 16:26:41.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 149,
#       "IS64BIT": 1,
#       "LABEL": "Fedora 24",
#       "MINIMAGESIZE": 1024,
#       "CREATE_DT": "2016-06-22 15:03:38.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 137,
#       "IS64BIT": 1,
#       "LABEL": "Gentoo 2014.12",
#       "MINIMAGESIZE": 2000,
#       "CREATE_DT": "2014-12-24 18:00:09.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 150,
#       "IS64BIT": 1,
#       "LABEL": "openSUSE Leap 42.1",
#       "MINIMAGESIZE": 1639,
#       "CREATE_DT": "2016-06-27 13:01:16.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 151,
#       "IS64BIT": 1,
#       "LABEL": "Slackware 14.2",
#       "MINIMAGESIZE": 1700,
#       "CREATE_DT": "2016-10-13 09:14:34.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 146,
#       "IS64BIT": 1,
#       "LABEL": "Ubuntu 16.04 LTS",
#       "MINIMAGESIZE": 800,
#       "CREATE_DT": "2016-04-22 14:11:29.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 0,
#       "DISTRIBUTIONID": 152,
#       "IS64BIT": 1,
#       "LABEL": "Ubuntu 16.10",
#       "MINIMAGESIZE": 1300,
#       "CREATE_DT": "2016-10-13 17:22:25.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 60,
#       "IS64BIT": 1,
#       "LABEL": "CentOS 5.6",
#       "MINIMAGESIZE": 950,
#       "CREATE_DT": "2009-08-17 00:00:00.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 127,
#       "IS64BIT": 1,
#       "LABEL": "CentOS 6.5",
#       "MINIMAGESIZE": 675,
#       "CREATE_DT": "2014-04-28 15:19:34.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 147,
#       "IS64BIT": 1,
#       "LABEL": "Fedora 23",
#       "MINIMAGESIZE": 1700,
#       "CREATE_DT": "2016-05-26 13:36:32.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 118,
#       "IS64BIT": 1,
#       "LABEL": "Gentoo 2013-11-26",
#       "MINIMAGESIZE": 3072,
#       "CREATE_DT": "2013-11-26 15:20:31.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 120,
#       "IS64BIT": 1,
#       "LABEL": "openSUSE 13.1",
#       "MINIMAGESIZE": 1024,
#       "CREATE_DT": "2013-12-02 12:53:29.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 135,
#       "IS64BIT": 1,
#       "LABEL": "openSUSE 13.2",
#       "MINIMAGESIZE": 700,
#       "CREATE_DT": "2014-12-17 17:55:42.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 87,
#       "IS64BIT": 1,
#       "LABEL": "Slackware 13.37",
#       "MINIMAGESIZE": 600,
#       "CREATE_DT": "2011-06-05 15:11:59.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 117,
#       "IS64BIT": 1,
#       "LABEL": "Slackware 14.1",
#       "MINIMAGESIZE": 1000,
#       "CREATE_DT": "2013-11-25 11:11:02.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 126,
#       "IS64BIT": 1,
#       "LABEL": "Ubuntu 12.04 LTS",
#       "MINIMAGESIZE": 550,
#       "CREATE_DT": "2014-04-28 14:16:59.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 124,
#       "IS64BIT": 1,
#       "LABEL": "Ubuntu 14.04 LTS",
#       "MINIMAGESIZE": 750,
#       "CREATE_DT": "2014-04-17 15:42:07.0"
#     },
#     {
#       "REQUIRESPVOPSKERNEL": 1,
#       "DISTRIBUTIONID": 86,
#       "IS64BIT": 0,
#       "LABEL": "Slackware 13.37 32bit",
#       "MINIMAGESIZE": 600,
#       "CREATE_DT": "2011-06-05 15:11:59.0"
#     }
#   ],
#   "ACTION": "avail.distributions"
# }
# =================== Linode Distrubtion API ends ================

# DISTRIBUTIONID
Ubuntu1204LTS=126
Ubuntu1404LTS=124
Ubuntu1604LTS=146

echo "1. Ubuntu 12.04 LTS"
echo "2. Ubuntu 14.04 LTS"
echo "3. Ubuntu 16.04 LTS"
read -p "Select Datacenter from above mentioned serial number : " distribution_serial_number

case $distribution_serial_number in
  1)
    echo "You have selected Ubuntu 12.04 LTS Distrubtion"
    DISTRIBUTIONID=$Ubuntu1204LTS
    DISTRIBUTIONNNAME='Ubuntu1204LTS'
    ;;
  2)
    echo "You have selected Ubuntu 14.04 LTS Distrubtion"
    DISTRIBUTIONID=$Ubuntu1404LTS
    DISTRIBUTIONNNAME='Ubuntu1404LTS'
    ;;
  3)
    echo "You have selected Ubuntu 16.04 LTS Distrubtion"
    DISTRIBUTIONID=$Ubuntu1604LTS
    DISTRIBUTIONNNAME='Ubuntu1604LTS'
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
# http://stackoverflow.com/questions/17368067/length-of-string-in-bash
if [ ${#content} != 0  ]
then
  error=`python -c "import sys, json; print json.loads(json.dumps($content))['ERRORARRAY']"`
  echo $error
  echo ${#error[@]}
  # Check for error message
  if [[ ${#error[@]} -eq 1 ]]
  then
    LINODEID=`python -c "import sys, json; print json.loads(json.dumps($content))['DATA']['LinodeID']"`
    echo $LINODEID
  fi
else
  echo "curl: (35) Server aborted the SSL handshake or Check your network"
  exit 1
fi

echo ${#LINODEID}

if [ ${#LINODEID} != 0 ]
then

  # ipurl="https://api.linode.com/?api_key=$LINODEKEY&api_action=linode.ip.addpublic&LinodeID=$LINODEID"

  # echo $ipurl
  # echo "Getting my ipaddress ......"

  # ipcontent=$(curl -H "${header}" -XGET "${ipurl}")

  # if [ ${#ipcontent} != 0  ]
  # then
  #   error=`python -c "import sys, json; print json.loads(json.dumps($ipcontent))['ERRORARRAY']"`
    
  #   if [[ ${#error[@]} -eq 1 ]]
  #   then
  #     IPADDRESS=`python -c "import sys, json; print json.loads(json.dumps($ipcontent))['DATA']['IPADDRESS']"`
  #     IPADDRESSID=`python -c "import sys, json; print json.loads(json.dumps($ipcontent))['DATA']['IPADDRESSID']"`
  #     echo "IP Address of the box - $IPADDRESS"
  #   else
  #     echo "Process failed while fetching ip address"
  #     echo $error
  #     exit 1
  #   fi
  # else
  #   echo "curl: (35) Server aborted the SSL handshake or Check your network"
  #   exit 1
  # fi

  DISTRIBUTIONLABEL="${LABEL}-${DISTRIBUTIONNNAME}"
  distributionurl="https://api.linode.com/?api_key=$LINODEKEY&api_action=linode.disk.createfromdistribution&LinodeID=$LINODEID&Label=$LABEL&Size=$DISKSPACE&rootPass=$ROOTPWD&DistributionID=$DISTRIBUTIONID"

  echo $distributionurl
  echo "Creating HD along with distribution on disk ......"

  distributioncontent=$(curl -H "${header}" -XGET "${distributionurl}")

  if [ ${#distributioncontent} != 0  ]
  then
    error=`python -c "import sys, json; print json.loads(json.dumps($distributioncontent))['ERRORARRAY']"`
    
    if [[ ${#error[@]} -eq 1 ]]
    then
      DISTRIBUTIONJOBID=`python -c "import sys, json; print json.loads(json.dumps($distributioncontent))['DATA']['JobID']"`
      DISTRIBUTIONDISKID=`python -c "import sys, json; print json.loads(json.dumps($distributioncontent))['DATA']['DiskID']"`
      echo "JobID for creating HD with distribution space on disk - $DISTRIBUTIONJOBID"
      echo "DiskID for the server - $DISTRIBUTIONDISKID"
    else
      echo "Process have been stopped when creating HD along with distribution on disk"
      echo $error
      exit 1
    fi
  else
    echo "curl: (35) Server aborted the SSL handshake or Check your network"
    exit 1
  fi
  
  # AVAILABLE ext3, ext4, swap, raw TYPE
  TYPE="swap"
  SWAPLABEL="${LABEL}-${TYPE}"
  

  swapurl="https://api.linode.com/?api_key=$LINODEKEY&api_action=linode.disk.create&LinodeID=$LINODEID&Label=$SWAPLABEL&Type=$TYPE&Size=$SWAPSIZE"

  echo $swapurl
  echo "Creating swap memory on disk ......"
  
  swapcontent=$(curl -H "${header}" -XGET "${swapurl}")

  if [ ${#swapcontent} != 0  ]
  then
    error=`python -c "import sys, json; print json.loads(json.dumps($swapcontent))['ERRORARRAY']"`
    if [[ ${#error[@]} -eq 1 ]]
    then
      SWAPJOBID=`python -c "import sys, json; print json.loads(json.dumps($swapcontent))['DATA']['JobID']"`
      SWAPDISKID=`python -c "import sys, json; print json.loads(json.dumps($swapcontent))['DATA']['DiskID']"`

      echo "JobID for creating swap space on disk - $SWAPJOBID"
      echo "DiskID for the server - $SWAPDISKID"
    else
      echo "Process have been stopped when creating swap memory on disk"
      echo $error
      exit 1
    fi
  else
    echo "curl: (35) Server aborted the SSL handshake or Check your network"
    exit 1
  fi



  # Need to update whenever there is a new update
  KERNALID=138
  DISTRIBUTIONLABEL="${LABEL}-${DISTRIBUTIONNNAME}"
  DISKLIST="${SWAPDISKID},${DISTRIBUTIONDISKID}"

  configurl="https://api.linode.com/?api_key=$LINODEKEY&api_action=linode.config.create&LinodeID=$LINODEID&KernelID=$KERNALID&Label=$LABEL&DiskList=$DISKLIST"

  echo $configurl
  echo "Creating config for the disk ......"

  configcontent=$(curl -H "${header}" -XGET "${configurl}")

  if [ ${#configcontent} != 0  ]
  then
    error=`python -c "import sys, json; print json.loads(json.dumps($configcontent))['ERRORARRAY']"`
    
    if [[ ${#error[@]} -eq 1 ]]
    then
      CONFIGID=`python -c "import sys, json; print json.loads(json.dumps($configcontent))['DATA']['ConfigID']"`
      echo "ConfigId for box - $CONFIGID"
    else
      echo "Process have been stopped while creating config on disk"
      echo $error
      exit 1
    fi
  else
    echo "curl: (35) Server aborted the SSL handshake or Check your network"
    exit 1
  fi

  # Boot api ConfigId can also be added only when we have more than one config. It happens when we do backup recovery
  booturl="https://api.linode.com/?api_key=$LINODEKEY&api_action=linode.boot&LinodeID=$LINODEID"

  echo $booturl
  echo "Booting the disk ......"

  bootcontent=$(curl -H "${header}" -XGET "${booturl}")

  if [ ${#bootcontent} != 0  ]
  then
    error=`python -c "import sys, json; print json.loads(json.dumps($bootcontent))['ERRORARRAY']"`
    
    if [[ ${#error[@]} -eq 1 ]]
    then
      BOOTJOBID=`python -c "import sys, json; print json.loads(json.dumps($bootcontent))['DATA']['JobID']"`
      echo "Boot job id for Box $LABEL - $BOOTJOBID"
    else
      echo "Process have been stopped while booting the box"
      echo $error
      exit 1
    fi
  else
    echo "curl: (35) Server aborted the SSL handshake or Check your network"
    exit 1
  fi
else
  exit 1
fi