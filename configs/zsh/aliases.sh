# ==========
# Ruby dev
# ==========

alias be="bundle exec"
alias bs="bundle exec rspec"
# Run changed specs
alias cleanup="rm -rf **/*.orig & rm -rf tmp/* & echo '' > log/development.log & echo '' > log/test.log"
alias migrate='rake db:migrate'
alias mlm='subl `ls -r db/migrate/* | head -n 1`'

#===========
# Elixir
#===========

alias mt="mix test"

# ==========
# git
# ==========
alias g="git"
alias gitc="git add -A && git commit -a"
alias gitrc='git commit -a --amend -C HEAD'
alias glog="git log --pretty=format:'%C(yellow)%h%Creset %C(bold blue)%ad%Creset %s %C(bold green)<%an>%Creset' --abbrev-commit --date=short"
alias changelog="git log --pretty=format:'- %s'"
alias glr='fact && git pull --rebase'
alias gds='git diff --staged'
alias grc='git rebase --continue'
alias gitp='git -c "interactive.diffFilter=less" add -p' # https://github.com/so-fancy/diff-so-fancy/issues/296
alias gitclear='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d' # deletes branches merged to master
alias gst="scmpuff_status"
alias gco="git checkout"
alias gp="git push -u"

# ==========
# random
# ==========
alias fact="elinks -dump randomfunfacts.com | sed -n '/^[┌│└]/p'"
alias notify="bg; wait %1; say 'Done!" # run long job -> Ctrl+z, $notify
alias servedir="ruby -rwebrick -e's=WEBrick::HTTPServer.new(:Port => 5555, :DocumentRoot => Dir.pwd).start'"
alias topcmd="history | awk '{print $2}' | awk 'BEGIN {FS=\"|\"} {print $1}' | sort | uniq -c | sort -r"
alias myipv4='dig @resolver1.opendns.com A myip.opendns.com +short -4'
alias howtocurl='curl https://cheat.sh/curl'
alias showports='netstat -tulpn'
alias ls='exa -la'
alias re='exec zsh' # reload sh session
alias open=xdg-open
alias edit="subl && wmctrl -a \"\$(wmctrl -l | grep subl | cut -f 1,2,3,4 -d ' ' --complement)\" 2>&1 >/dev/null" # open in sublime and focus
alias zshrc='edit ~/.zshrc'
alias screencast='sleep 3 && ffmpeg -y -f x11grab -r 25 -s 1920x1080 -i :0.0 -vcodec libx265 -crf 28 ~/Downloads/screencast.mp4'
alias browse='nautilus . > /dev/null 2>&1 &'
alias pbcopy='xclip -sel clip'
alias copyip='myipv4 | pbcopy'
