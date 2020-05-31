# Global shell setup for chruby

# Restrict to interactive shell only
# [[ $- == *i* ]] || return 0

if [ -n \"\$BASH_VERSION\" ] || [ -n \"\$ZSH_VERSION\" ]; then
	source "/usr/share/chruby/chruby.sh"
	source "/usr/share/chruby/auto.sh"
# else
    # return 0
fi
