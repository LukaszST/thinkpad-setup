sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
sudo apt install tlp tlp-rdw
sudo tlp start
echo 'SETTING CHARGE LIMIT'
OUTPUT=$(sudo tlp-stat -b $1 2> /dev/null | grep "Supported features: " | grep -o "charge threshold")

if [ "${OUTPUT}" == "charge threshold" ] ; then
    sudo tlp setcharge 70 80
else
    sudo apt install tp-smapi-dkms
fi
