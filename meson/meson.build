project('myproject', 'c', version: '1.0')

# Define FROM_CMAKE_OR_MESON to prevent Autotools conflicts
add_project_arguments('-DFROM_CMAKE_OR_MESON', language: 'c')

# Feature flags (example)
enable_debug = get_option('debug')
if enable_debug
  add_project_arguments('-DDEBUG=1', language: 'c')
  add_project_arguments('-g3', '-O0', language: 'c')
endif

# Sources (relative to meson/)
sources = files(
  '../src/main.c',
  '../src/utils.c',
)

# Libraries (example)
m_dep = dependency('m', required: false)

executable('myapp',
  sources,
  dependencies: [m_dep],
)