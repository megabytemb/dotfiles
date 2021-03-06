autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_branch() {
  echo $(/usr/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
      st=$(/usr/bin/git status 2>/dev/null | tail -n 2)
      if [[ $st == "" ]]
      then
          echo ""
      else
          echo " (%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}$(need_push))"
      fi
  else
    if [[ $st == "nothing to commit (working directory clean)" || $st == "nothing to commit, working directory clean" || $st == "nothing to commit, working tree clean" ]]
    then
      echo " (%{$fg[green]%}$(git_prompt_info)%{$reset_color%}$(need_push))"
    else
      echo " (%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}$(need_push))"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

project_name () {
  name=$(pwd | awk -F'projects/' '{print $2}' | awk -F/ '{print $1}')
  echo $name
}

project_name_color () {
  #name=$(project_name)
  echo "%{\e[0;35m%}${name}%{\e[0m%}"
}

unpushed () {
  /usr/bin/git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo ":%{$fg_bold[magenta]%}unpushed%{$reset_color%}"
  fi
}

hostname_prompt(){
  echo "%{$fg[yellow]%}$(hostname)%{$reset_color%}"
}
username_prompt(){
  echo "%{$fg[magenta]%}%n%{$reset_color%}"
}

# This keeps the number of todos always available the right hand side of my
# command line. I filter it to only count those tagged as "+next", so it's more
# of a motivation to clear out the list.
todo(){
  if $(which todo.sh &> /dev/null)
  then
    num=$(echo $(todo.sh ls +next | wc -l))
    let todos=num-2
    if [ $todos != 0 ]
    then
      echo "$todos"
    else
      echo ""
    fi
  else
    echo ""
  fi
}

directory_name(){
  echo "%{$fg[cyan]%}%1/%\/%{$reset_color%}"
}

emoji() {
    current_folder=${PWD##*/}
    if [[ $current_folder == 'love' && $platform == 'osx' ]]
    then
        echo "❤️ "
    else
        echo "$"
    fi
}


export PROMPT=$'$(username_prompt)@$(hostname_prompt):$(directory_name)$(project_name_color)$(git_dirty)$(emoji) '
set_prompt () {
  export RPROMPT="%{$fg_bold[grey]%}$(todo)%{$reset_color%}"
}

precmd() {
  title "zsh" "$USER@%m" "%55<...<%~"
  set_prompt
}
