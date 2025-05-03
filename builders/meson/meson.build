project('myproject', ['c', 'cpp'], version: '1.0',
        default_options: ['cpp_std=c++17'])

# Get configuration options
project_name = get_option('PROJECT_NAME')
executable_name = get_option('EXECUTABLE_NAME')
project_type = get_option('PROJECT_TYPE')

# Source discovery
src_dir = meson.project_source_root() / '..' / '..' / 'src'
sources = []
extensions = ['*.c', '*.cpp', '*.c++', '*.cxx']

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

# Convert to files() objects
sources_files = []
foreach s : sources
    if s != ''
        sources_files += files(s)
    endif
endforeach

# Dependencies
threads_dep = dependency('threads')

# Build target
if project_type == 'executable'
    executable(executable_name,
        sources_files,
        dependencies: [threads_dep],
        install: true
    )
elif project_type == 'static_lib'
    static_library(executable_name,
        sources_files,
        dependencies: [threads_dep],
        install: true
    )
elif project_type == 'shared_lib'
    shared_library(executable_name,
        sources_files,
        dependencies: [threads_dep],
        install: true
    )
else
    error('Invalid PROJECT_TYPE: ' + project_type + '. Must be executable, static_lib, or shared_lib')
endif