# 自用 nvim 配置

1.先把仓库内容 clone 到 `~/AppData/Local/nvim/` 目录下。
2.然后打开 nvim 执行 `:PackerSync` 同步插件。

如果插件安装失败或者其他网络原因导致的问题，以下是开启代理的方式：

```PS
$Env:http_proxy="http://127.0.0.1:7890";$Env:https_proxy="http://127.0.0.1:7890"
```

开启 git 代理：

```PS
# 设置
git config --global http.proxy 'socks5://127.0.0.1:7890' 
git config --global https.proxy 'socks5://127.0.0.1:7890'

# 恢复
git config --global --unset http.proxy
git config --global --unset https.proxy
```

开启 npm 代理

```PS
# 设置
npm config set proxy http://127.0.0.1:7890
npm config set https-proxy http://127.0.0.1:7890

# 恢复
npm config delete proxy
npm config delete https-proxy
```

