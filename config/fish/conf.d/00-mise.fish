# Homebrew's fish vendor conf (mise-activate.fish) runs `mise activate` before
# config.fish, so config.fish's fish_add_path would then shove /opt/homebrew/bin
# ahead of mise's tool dirs. Interactive shells recover via mise's prompt hook,
# but non-interactive shells (anything shelling out, e.g. tools/editors) don't,
# so they'd resolve node/etc. to Homebrew instead of the mise-pinned version.
#
# Disable the vendor auto-activation here (this conf.d file sorts before the
# vendor one) and activate mise explicitly at the end of config.fish, after
# PATH is built, so mise's tool dirs stay in front everywhere.
set -gx MISE_FISH_AUTO_ACTIVATE 0
