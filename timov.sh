#!/bin/bash
TIMOV_PATH="$HOME/.timov.sh"
TIMOV_NOTES_PATH="$HOME/.timov"

function logdate {
  date "+%m/%d/%y %Hh%Mm%Ss"
}

if ! [[ -d $TIMOV_NOTES_PATH ]]; then
  git clone $TIMOV_NOTES_URL $TIMOV_NOTES_PATH
fi

cd $TIMOV_NOTES_PATH

echo "[TIMOV $(logdate)] Updating notes..."
if [[ $(git pull) =~ error ]]; then
  exit 1
fi

git add .
git commit -m "$(date)"

if [[ $(git push origin main) =~ error ]]; then
  exit 1
fi

echo "[TIMOV $(logdate)] All done!"
