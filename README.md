## My Lvim
个人编辑器配置

基于 lunarvim 配置

内置`lsp_config`支持多种语法解析

`rust` 和 `java` 单独安装插件优化

## 需要安装工具

#### rust-tools
1. `rust-analyzer` install cmd `rustup component add rust-analyzer` or `rustup component add rust-analysis`
2. `dot` from `graphviz` (only for crate graph)

### jdtls 
1. `jdtls` at dir `~/.jdtls/jdtls-1.9.0`
2. `lombok` at dir `~/.jdtls/lombok.jar`

### jdtls and dap
1. [Debugger](https://github.com/mfussenegger/nvim-jdtls#debugger-via-nvim-dap) install step doc
2. Clone [java-debug](https://github.com/microsoft/java-debug) `clean install`  Or Download [jar](https://repo1.maven.org/maven2/com/microsoft/java/com.microsoft.java.debug.plugin/0.44.0/com.microsoft.java.debug.plugin-0.44.0.jar) 
3. Clone [vscode-java-test](https://github.com/microsoft/vscode-java-test) And run `npm instal && npm run build-plugin`

Run command
```
require('jdtls.dap').setup_dap_main_class_configs()

require'jdtls'.test_class()
require'jdtls'.test_nearest_method()
```

#### rest
1. `jq` install `brew install jq`
2. `tidy` install `brew install tidy`

### sqls
1. `go install github.com/lighttiger2505/sqls@latest`
2. `~/.config/sqls.yml` config db connection

#### search
1. `gnu-sed` install `brew install gnu-sed`

