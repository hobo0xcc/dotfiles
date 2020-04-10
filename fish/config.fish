set -gx PATH \
/Users/hobo/.cargo/bin \
/Users/hobo/go/bin \
/Users/hobo/Develop/opt/zig \
/usr/local/opt/llvm/bin \
/Users/hobo/d/opt/zig/build/bin \
$PATH

# set -gx RUSTC_WRAPPER /Users/hobo/.cargo/bin/sccache $RUSTC_WRAPPER
set -gx LC_ALL en_US.UTF-8 $LC_ALL
set -gx LANG en_US.UTF-8 $LANG
alias clang="/usr/bin/clang"
alias clang++="/usr/bin/clang++"
