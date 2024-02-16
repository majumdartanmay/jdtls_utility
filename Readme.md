# JDTLS Utility [![JDTLS Utility CI](https://github.com/majumdartanmay/jdtls_utility/actions/workflows/build.yml/badge.svg)](https://github.com/majumdartanmay/jdtls_utility/actions/workflows/build.yml)

Tired of manually configuring nvim-jdtls, the powerful Language Server Protocol (LSP) plugin for Neovim that elevates your Java development experience? Look no further! This ANT script takes the hassle out of the setup process, allowing you to focus on crafting amazing code.

It is quite easy to setup nvim-jdtls using Mason. However, its difficult to customize the JDTLS configuration post mason based installation.

## What will it do

1. Download [eclipse.jdt.ls](https://github.com/eclipse/eclipse.jdt.ls). The download link for JDTLS is configurable. All confiurable properties will be covered in the later section.
2. Extract the JDTLS zip to a output location of your choice. (By default its ./bin)
3. We have a template of the lua configuration file. The template is located at [java.config.template.lua](https://github.com/majumdartanmay/jdtls_utility/blob/main/java.config.template.lua)
4. The ANT script will replace the necessary values and created the configuration folder in output directory. By default the output directory in bin
5. You can take thies output configuration and simply reference it somewhere in your neo vim configuration. 
6. It will use JAVA_HOME for your JDTLS configuration. Use build.properties if you want to override that.

## Prerequisites?

1. Ant (Tested with 1.10.14)
2. Java (Test with JDK 11, 8 and 21)
3. Some basic knowledge of how Neo vim plugin configurations and installation works
4. The nvim-jdtls plugin [should be already installed](https://github.com/mfussenegger/nvim-jdtls?tab=readme-ov-file#plugin-installation).

**Note**: It should still be possible to use with other version of JDK and ANT since the ANT script is pretty basic here. Although keep in mind, JDTLS itself is not going to work with any JDK which is lower that 17.

## Quickstart

```python

ant -Djdtls_output_dir=<your_desired_jdtls_installation directory>

# By default the JDTLS installation directory in the output directory
```

This will create a lua configuration file inside the output folder. By default that configuration file will be named java.config.lua

## Customizations

All customization can be made through [build.properties](https://github.com/majumdartanmay/jdtls_utility/blob/main/build.properties)

```python


output=./bin
# Output directory, where all the temporary files will be generated. This is recreated at every execution.

download_file_name=eclipse-jdtls.tar.gz
# When the JDLTS file is downloaded. This is the name that will be used in your local storage.

internal_output_path_full=${output}/${download_file_name}
# This is the full path where the eclipse-jdtls.tar file will be downloaded 

jdtls_download_link=https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz
# Download link of the eclipse-jdtls binary

output_file_name=java.config.lua
# Final config file which is supposed to be used by the users.

input_file_template=java.config.template.lua
# The template file. Based on which ${output_file_name} is generated.

```

## Sample configuration file

This is how a typical configuration file will look like

```lua

local config = {
  cmd = {

    'C:/Program Files/Eclipse Adoptium/jdk-21.0.1.12-hotspot/bin/java', 
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', 'C:/Users/TANMAY/AppData/Local/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', 'C:/Users/TANMAY/AppData/Local/jdtls//config_win',
  },
}

local function start_jdtls()
  print("Attempting to start JDTLS");
  require('jdtls').start_or_attach(config)
end

vim.keymap.set('n', '<M-j>', start_jdtls, { noremap = true, silent = true, desc = "Start JDTLS server" })

```

## CI/CD

I have created github action jobs which will ensure that the ANT script is working for Linux,  Windows and Mac.
Us
e the status badge [![JDTLS Utility CI](https://github.com/majumdartanmay/jdtls_utility/actions/workflows/build.yml/badge.svg)](https://github.com/majumdartanmay/jdtls_utility/actions/workflows/build.yml) to see how the piipelines are fairing

