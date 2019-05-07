# Executed by the command interpreter for login shells.
# Not read by bash if ~/.bash_profile or ~/.bash_login exists,
# so need to source it from those files.

# Set PATH to includes user's private bins if they exist
if [[ -d "$HOME/bin" ]]; then
    PATH="$HOME/bin:$PATH"
fi
if [[ -d "$HOME/.local/bin" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi
