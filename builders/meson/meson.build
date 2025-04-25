project('myproject', ['c', 'cpp'], version: '1.0',
        default_options: ['cpp_std=c++17'])

executable_name = get_option('EXECUTABLE_NAME')

# Debug printing - show important paths
message('Project source root: ' + meson.project_source_root())
message('Current source dir: ' + meson.current_source_dir())

# Recursive source discovery with fallbacks
src_dir = meson.project_source_root() / '..' / '..' / 'src'
message('Looking for sources in: ' + src_dir)

sources = []
extensions = ['*.c', '*.cpp', '*.c++', '*.cxx']

# Method 1: Try native globbing first
foreach ext : extensions
    cmd = run_command('find', src_dir, '-type', 'f', '-name', ext, check: false)
    if cmd.returncode() == 0
        raw_output = cmd.stdout().strip()
        foreach s : raw_output.split('\n')
            if s != ''
                sources += s
            endif
        endforeach
    endif
endforeach

message('Found sources count (method 1): ' + sources.length().to_string())

# Method 2: Python fallback if first method failed
if sources.length() == 0
    message('Trying Python fallback')
    python = import('python').find_installation('python3')
    cmd = run_command(
        python, '-c',
        '''
import os
exts = (".c", ".cpp", ".c++", ".cxx")
for root, _, files in os.walk("''' + src_dir + '''"):
    for f in files:
        if f.endswith(exts):
            print(os.path.join(root, f))
        ''',
        check: true
    )
    raw_output = cmd.stdout().strip()
    foreach s : raw_output.split('\n')
        if s != ''
            sources += s
        endif
    endforeach
endif

message('Found sources count (method 2): ' + sources.length().to_string())

# Final fallback if still no sources
if sources.length() == 0
    warning('No source files found automatically! Using fallback list')
    sources = [
        '../src/main.c',
        '../src/main.cpp'
    ]
endif

# Convert to files() objects
sources_files = []
foreach s : sources
    if s != ''
        message('Adding source: ' + s)
        sources_files += files(s)
    endif
endforeach

# Verify we have sources
if sources_files.length() == 0
    error('No valid source files found!')
else
    message('Final source files count: ' + sources_files.length().to_string())
endif

# Build target
executable(executable_name,
    sources_files,
    dependencies: [dependency('threads')],
    install: true,
#    install_dir: '../../build/bin'  # Relative to build dir
)