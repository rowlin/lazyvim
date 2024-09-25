local util = require("lspconfig.util")

return {
  default_config = {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    root_dir = function(pattern)
      local cwd = vim.loop.cwd()
      local root = util.root_pattern( ".git")(pattern)

      -- prefer cwd if root is a descendant
      return util.path.is_descendant(cwd, root) and cwd or root
    end,
    init_options = {
      globalStoragePath = "/home/a/Code/",
      licenceKey = "00O51U5K974BCH1",
      clearCache = true,
    },
    settings = {
      intelephense = {
        files = {
          maxSize = {
            type = "number",
            default = 10000000,
            description = "Maximum file size in bytes.",
            scope = "window",
          },
          associations = {
            type = "array",
            default = {
              "*.php",
              "*.phtml",
              "*.inc",
            },
            description = "Configure glob patterns to make files available language server features. Inherits from files.associations.",
            scope = "window",
          },
        },
        telemetry = {
          enabled = true,
        },
        compatibility = {
          correctForBaseClassStaticUnionTypes = true,
          correctForArrayAccessArrayAndTraversableArrayUnionTypes = true,
          documentFormattingProvider = true,
          documentRangeFormattingProvider = true,
          foldingRangeProvider = true,
          implementationProvider = true,
          declarationProvider = true,
          renameProvider = {
            prepareProvider = true,
          },
          typeDefinitionProvider = true,
          selectionRangeProvider = true,
        },
        completion = {
          insertUseDeclaration = true,
          fullyQualifyGlobalConstantsAndFunctions = true,
          triggerParameterHints = true,
          maxItems = 1000,
        },
        diagnostics = {
          enable = true,
          embeddedLanguages = true,
          undefinedConstants = false,
          undefinedClassConstants = true,
          undefinedVariables = true,
          undefinedTypes = true,
          undefinedFunctions = false,
          undefinedMethods = true,
          undefinedProperties = true,
          undefinedSymbols = false,
          unexpectedTokens = true,
          duplicateSymbols = true,
          implementationErrors = true,
          argumentCount = true,
          typeErrors = true,
          deprecated = true,
        },
        format = {
          enable = true,
          braces = "k&r",
        },
        environment = {
          phpVersion = "8.2.0",
          documentRoot = "public/index",
        },
      },
    },
  },
  docs = {
    description = [[
https://intelephense.com/

`intelephense` can be installed via `npm`:
```sh
npm install -g intelephense
```
]],
    default_config = {
      root_dir = root_pattern("composer.json", ".git"),
      init_options = [[{
        storagePath = Optional absolute path to storage dir. Defaults to os.tmpdir().
        globalStoragePath = Optional absolute path to a global storage dir. Defaults to os.homedir().
        licenceKey = Optional licence key or absolute path to a text file containing the licence key.
        clearCache = Optional flag to clear server state. State can also be cleared by deleting {storagePath}/intelephense
        -- See https://github.com/bmewburn/intelephense-docs/blob/master/installation.md#initialisation-options
      }]],
      settings = [[{
        intelephense = {
          files = {
            maxSize = 1000000;
          };
        };
        -- See https://github.com/bmewburn/intelephense-docs
      }]],
    },
  },
}
