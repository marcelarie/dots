#### Packages

2023-05-24

```bash
npm install -g \
typescript-language-server \
typescript pnpm speed-test \
bash-language-server intelephense \
vim-language-server bash-language-server \
yaml-language-server \
vscode-langservers-extracted \
vscode-json-languageserver \
dockerfile-language-server-nodejs pyright \
eslint_d
```

`npm` packages:
`apk-mitm@1.1.0 axios@0.23.0 dockerfile-language-server-nodejs@0.7.2 intelephense@1.7.1 jimp@0.16.1 markdown-pdf@10.0.0 neovim@4.10.1 npm@8.3.0 opencv-wasm@4.3.0-10 pixelmatch@5.2.1 puppeteer-extra-plugin-stealth@2.9.0 puppeteer-extra-plugin-user-data-dir@2.3.1 puppeteer-extra-plugin-user-preferences@2.3.1 puppeteer-extra-plugin@3.2.0 puppeteer-extra@3.2.3 puppeteer@13.0.1 typescript-language-server@0.6.4 typescript@4.4.4 vim-language-server@2.2.5 vscode-langservers-extracted@3.0.1 xvfb@0.4.0 yaml-language-server@1.0.0`

pip packages:
`mdformat-gfm`

#### Fix install nvim from source 

```shell
sudo rm -rf ~/programs/neovim/build
sudo make diskclean
```

#### Fix Firefox resize on TWM:

- Go to `about:config` and change `privacy.resistFingerprinting` to `true`

#### Fix `gpg: public key decryption failed: No pinentry`

```shell
pkill gpg-agent
```
