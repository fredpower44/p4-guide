#! /bin/bash
TREXPATH=/opt/trex
TREXVER=v2.90

echo 'Creating T-Rex directory'
sudo mkdir $TREXPATH

echo 'Downloading and extracting T-Rex v2.90'
sudo wget -P $TREXPATH --no-cache https://trex-tgn.cisco.com/trex/release/$TREXVER.tar.gz --no-check-certificate
sudo tar -xzvf $TREXPATH/$TREXVER.tar.gz -C $TREXPATH

echo 'Setting up T-Rex port configurations'
sudo cp trex_cfg.yaml /etc/trex_cfg.yaml

echo 'Uninstalling scapy and installing T-Rex scapy package'
sudo rm -rf /usr/local/lib/python3.8/dist-packages/scapy
sudo cp -r $TREXPATH/$TREXVER/external_libs/scapy-2.4.3/scapy /usr/local/lib/python3.8/dist-packages/scapy