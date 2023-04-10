arch="x64"
directive=""
compiler="gcc"
script=`basename "$0"`
compset=0
archset=0
nocross=0
own_arch=$(uname -i)
s_file="dynomem.amd64.S"
c_showcase=clibdynomem/showcase.c
py_showcase=pylibdynomem/showcase.py
rs_showcase=rslibdynomem/showcase.rs
s_amd64=aslibdynomem/dynomem.amd64.S
s_aarch64=aslibdynomem/dynomem.aarch64.S
args=($@)

help() {
    printf "\033[1;34mDynoMem Showcase by Chubak Bidpaa --- March 2023\033[0m\n"
    printf "Usages:\033[0m\n"
    echo "Usage 1: $script --[long options=<value>] --[long flags]  DIRECTIVE <directive arguments>" 
    echo "Usage 2: $script -[short options=<value>] -[short flags] DIRECTIVE  <directive arguments>" 
    echo "Usage 3: $script --help"
    echo "Usage 4: $script -h"
    echo "Usage 5: $script SAVE-HELP <filepath>"
    echo "No arguments and --help/-h will exit with status 1."
    echo "SAVE-HELP will just save the contents of this very help to the given text file"
    echo
    echo "General Options:"
    echo
    echo "   [--language/-l] Language:\033[0m (Default: c)"
    echo "       c, cc, or 1"
    echo "       rs, rust or 2"
    echo "       py, python or 3"
    echo
    echo "Language-specific Options:"
    echo
    echo "   [--compiler/-c] C Compiler: (Default: gcc)"
    echo "       You may choose an alternative C compiler with this option.       "
    echo "       Paths to executables withstanding.        "
    echo "       Before calling the executable, Bash will make sure you "
    echo "       have passed an executable application.       "
    echo "       Passing --cross/-x will affect the [pre]set value.      "
    echo
    echo "   [--target/-t] Rust Target: (Default: x86_64-unknown-linux-gnu)   "
    echo "       You may generally pass any dash-separated target triplets.           "
    echo "       The script will get the list of targets installed using  "
    echo "       'rustup target list' and if the selected target is not on the list,"
    echo "       or otherwise, not installed, it will error out.   "
    echo
    echo "   [--interpreter/-i] Python Interpreter: (Default: python3)   "
    echo "       You may choose an alternative Python interpreter with this option.            "
    echo "       Just like C compiler, it will make sure the path or executable exists.   "
    echo 
    echo "   [--sopath[r]/-s[r]] Python Path to Dynamic Library (Default: /tmp/libdynomem.so)  "
    echo "       Python needs a shared object of C bindings. With this object you may change      "
    echo "       the path to the shared object. If you append the argument name with and r,"
    echo "       then it will regenerate that object."
    echo "       the shared object compilation is done in Bash, not Python. An special script exists for it."
    echo
    echo "General Flags:"
    echo "   [--quiet/-q] Quiet Logging (Default: Off) "
    echo "       Do not log anything,"
    echo
    echo "   [--cross/-x] Cross Compile (Default: Off) "
    echo "       This flag will cross-compile the library for C and Python's shared object.           "
    echo "       This only is valid if your host architecture is x86-64, and the cross target is Aarch64.         "
    echo "       The reverse is impossible. Also, since Rust uses LLVM, you can compile both Assembly files     "
    echo "       any architecture. So when you pass cross, all that changes for Rust is a #[cfg]. But for C,"
    echo "       the script will switch to aarch64-linux-gnu-gcc compiler.  "
    echo
    echo "Languagee-specific flags:"
    echo "   [--rsbind/-r] Bind Python with Rust    "
    echo "       This flag will have the shared object used in Python bindings be generated from Rust.       "
    echo "       Very useful for benchmarking.     "
    echo "Directives:\033[0m\n"
    echo "STLEN <strings to get length of...>"
    echo "ALLOC -l=<LENGTH> -nb=<NUMBYTES> -ip<INTEGER TO FILL WITH>"
    echo "REALLOC -lo=<LENGTH> -ln=<RESIZE LENGTH> -nb=<NUMBYTES> -ip=<INTEGER TO FILL WITH>"
    echo "UNALLOC <LENGTH> <NUMBYTES> <INTEGER TO FILL WITH>"
    echo "MEMCPY <LENGTH> <NUMBYTES> <INTEGER TO FILL WITH AND COPY>"
    echo "STRCPY <LENGTH> <STRING TO FILL WITH AND COPY>"
    echo "SIZER <LENGTH> <NUMBYTES>"
    echo "NOTE: Directives must be all-uppercase!"
    echo
    echo "Examples:"
    echo "$script -x64 --gcc STLEN mystring1 mystring2"
    echo "$script UNALLOC 10 1 MAX_U8"
    echo "$script -c-nx --arch64 SIZER 22 12"
    echo "$script ALLOC 12 2 32"
    exit 1;
}

error_arg() {
    printf "\033[1;31mError:\033[0m Wrong number of arguments and/or order thereof.\n"
    echo "Pass --help or -h for help."
    exit 1;
}


case_one_arg() {
    if [[ ${args[0]} == -?(-)h?(elp) ]]; then
        help
    else
        error_arg
    fi
}

attempt_set_options() {
    if [[ ${args[0]} =~ ^[A-Z]+$ ]] && [[ ${args[1]} == ^-*$ ]]; then
        echo "Passing a directive before an option is disallowed."
        error_arg
    fi
    
    for i in 0 1
    do
        arg=${args[i]}
        if [[ $arg == ^?(-)-@(x|a)?(86-|arch)64$ ]]; then
            if [ $archset -eq 1 ]; then
                echo "Attempt to set architecture twice"
                error_arg
            fi

            arch=$(echo $arg | sed -r 's/-//g')
            archset=1
            args=${args[@]/i}
        elif [[ $arg == ^?(-)-@(g?(cc)|c?(c)|cl?(ang))?(-nx)$ ]]; then
            if [ $compset -eq 1 ]; then
                echo "Attempt to set compiler twice"
                error_arg
            fi

            if [[ $arg == *"-nx" ]]; then nocross=1; fi

            compiler=$(echo $arg | sed -r 's/-nx|-//g')
            compset=1
            args=${args[@]/i}
        fi
    done
}

attempt_set_directive() {
    case ${#args[@]} in
        0)
            echo "No directive with arguments set"
            error_arg
            ;;
        1)
            echo "Need at least one argument for a directive"
            error_arg
            ;;
        *)
            first_arg=${args[0]}

            if [[ $first_arg =~ ^[A-Z]+$  ]]; then
                :
            else
                echo "Directive must be in all-caps."
                error_arg
            fi

            case ${#args[@]} in
                2)
                    case $first_arg in
                        "STLEN")
                            directive="STLEN" && shift
                            ;;
                        *)
                            echo "Acceptable directives for this number of arguments: STLEN"
                            error_arg
                    esac
                    ;;
                3)
                    case $first_arg in
                        "STLEN")
                            directive="STLEN" && shift
                            ;;
                        "SIZER")
                            directive="SIZER" && shift
                            ;;
                        "STRCPY")
                            directive="STRCPY" && shift
                            ;;
                        *)
                            echo "Acceptable directives for this number of arguments: STLEN, SIZER, STRCPY"
                            error_arg
                    esac
                    ;;
                4)
                    case $first_arg in
                        "STLEN")
                            directive="STLEN" && shift
                            ;;
                        "ALLOC")
                            directive="ALLOC" && shift
                            ;;
                        "MEMCPY")
                            directive="MEMCPY" && shift
                            ;;
                        *)
                            echo "Acceptable directives for this number of arguments: STLEN, ALLOC, MEMCPY"
                            error_arg
                    esac
                    ;;
                5)
                    case $first_arg in
                        "STLEN")
                            directive="STLEN" && shift
                            ;;
                        "REALLOC")
                            directive="REALLOC" && shift
                            ;;
                        *)
                            echo "Acceptable directives for this number of arguments: STLEN, REALLOC"
                            error_arg
                    esac
                    ;;
                *)
                    echo "Minimum amount of actionable arguments: 2"
                    error_arg
            esac
    esac
}

case $# in
    0) error_arg;;
    1) case_one_arg;;
    *)
        attempt_set_options
        attempt_set_directive

esac

case $compiler in
    "gcc" | "g")
        echo "Compiler: GNU CC"
        ;;
    "cc" | "c")
        echo "Compiler: Non-GNU CC"
        ;;
    "clang" | "cl")
        echo "Compiler: Clang"
        ;;
    *)
        echo "Unknown compiler chosen, using GNU CC..."
        compiler="gcc"
        ;;
esac

case $arch in
    "a64" | "aarch64")
        if [[ $own_arch != "a?(rm|arch)64" ]]; then
            echo "Architecture compliant, using $compiler"
        elif [[ $own_arch != "a?(rm|arch)64" ]] && [ $nocross -eq 1 ]; then
            echo "Architecture non-compliant, however, no-cross is enabled, using $compiler"
        else
            compiler="aarch64-linux-gnu-gcc"
            echo "Architecture not compliant, and no-cross opted out, using $compiler..."
        fi

        s_file=$s_aarch64
        ;;
    "x64" | "x86-64")
        if [[ $own_arch != "x86_64" ]]; then
            echo "Cross-compiling for x86-64 CPUs from non-compliant architectures is impossible."
            echo "You can, however, cross-compile for Aarch64 under x86-64."
            echo "If you are on an ARM64 machine, run the script with -a64/--arch64 option."
            echo "If you are on neither archiectures, what are you doing back on earth, Terry? :)"
            exit 1;
        fi
        s_file=$s_amd64
        ;;
    *)
        echo "Unknown architecture chosen. Opting to choose your own architecture..."
        if [[ $own_arch != "a?(rm|arch)64" ]]; then
            s_file=$s_aarch64
        elif [[ $own_arch != "x86_64" ]]; then
            s_file=$s_amd64
        else
            echo "You can't run this script under $own_arch architecture"
            exit 1;
        ;;
esac

echo "Running DynoMem after compiling with $compiler, for the $arch architecture and directive $directive..."
mkdir -p /tmp/dynomem
rm -f /tmp/dynomem/dynomemshowcase
$compiler -static $c_showcase $s_file -o /tmp/dynomem/dynomemshowcase
/tmp/dynomem/dynomemshowcase $@