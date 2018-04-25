# Install necessary softwares and make linux server(Ubuntu or Debian) profile.
sudo apt-get update
sudo apt-get install git -y
git clone https://github.com/zhanzongyuan/linux-profile.git
cat ./linux-profile/.bashrc>> ~/.bashrc


