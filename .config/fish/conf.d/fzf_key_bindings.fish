bind \ct '__fzf_find_file'
bind \cr '__fzf_reverse_isearch'
bind \cn '__fzf_cd'

if set -q FZF_COMPLETE
    bind \t '__fzf_complete'
    if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \t '__fzf_complete'
    end
end

function fzf_key_bindings_uninstall -e fzf_key_bindings_uninstall
    # disabled until we figure out a sensible way to ensure user overrides
    # are not erased
    # set -l _bindings (bind -a | sed -En "s/(')?__fzf.*\$//p" | sed 's/bind/bind -e/')
    # for binding in $_bindings
    #     eval $binding
    # end
end
