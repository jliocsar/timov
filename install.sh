guser=$(git config user.name)
timov_url="https://raw.githubusercontent.com/$guser/timov/main/timov.sh"

echo "Downloading Timov..."
curl -sSfL $TIMOV_URL > $HOME/.timov.sh
chmod +x $HOME/.timov.sh

echo "Adding Timov to crontab..."
echo "$(crontab -l)\n*/2 * * * * $HOME/.timov.sh >> /tmp/timov.log" | crontab -

echo "All done!"
