guser=$(git config user.name)
timov_url="https://raw.githubusercontent.com/$guser/timov/main/timov.sh"

echo "Downloading Timov..."
curl -sSfL $timov_url > $HOME/.timov.sh
chmod +x $HOME/.timov.sh

echo "Adding Timov to crontab..."
cur_cron=$(crontab -l | sed -e "s@.*timov\.sh.*@@g")
echo "$($cur_cron)\n*/2 * * * * $HOME/.timov.sh >> /tmp/timov.log" | crontab -

echo "All done!"
