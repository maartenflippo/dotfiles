# Ubuntu's /etc/zsh/zshrc runs its own unsuppressed `compinit` before this
# user's .zshrc is sourced. That call trips a spurious "no such file or
# directory" warning whenever Docker Desktop's WSL integration leaves a
# dangling symlink at /usr/share/zsh/vendor-completions/_docker. Skip it here
# and let .zshrc run compinit itself, where the warning is suppressed.
skip_global_compinit=1
