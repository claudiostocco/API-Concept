# Adicionar Horse a um projeto Delphi/Lazarus

Criar pasta [.modules], nesta pasta executar [git clone] para as dependências e adicionar o caminho no classpath do projeto.

## Core do Horse
git clone https://github.com/HashLoad/horse.git

## Para tratar JSON
git clone https://github.com/HashLoad/jhonson.git

## Dependência JWT
   ### Lazarus
   git clone https://github.com/andre-djsystem/HashLib4Pascal.git
   ### Delphi
   git clone https://github.com/paolo-rossi/delphi-jose-jwt.git 

## Gerenciar autenticação por JWT
git clone https://github.com/HashLoad/horse-jwt.git

## Suporte ao CORS
git clone https://github.com/HashLoad/horse-cors.git

## Gerar exceções como retorno do horse
git clone https://github.com/HashLoad/handle-exception.git

## Geristrar logs das requisições
git clone https://github.com/HashLoad/horse-logger.git

- É necessário o provider para os logs

### Dependência do provider file
git clone https://github.com/dliocode/horse-utils-clientip.git

### Privider para gerar log em arquivo
git clone https://github.com/HashLoad/horse-logger-provider-logfile.git


## Paths a adicionar

- .modules/horse/src
- .modules/jhonson/src
- .modules/horse-cors/src
- .modules/handle-exception/src
- .modules/horse-logger-provider-logfile/src
- .modules/horse-logger/src

### Para o JWT Delphi

- .modules/horse-jwt/src
- .modules/delphi-jose-jwt/Source/Common
- .modules/delphi-jose-jwt/Source/JOSE

### Para o JWT Lazarus

- .modules/horse-jwt/src
- .modules/HashLib/src/Base
- .modules/HashLib/src/Checksum
- .modules/HashLib/src/Crypto
- .modules/HashLib/src/Hash128
- .modules/HashLib/src/Hash32
- .modules/HashLib/src/Hash64
- .modules/HashLib/src/Include
- .modules/HashLib/src/Interfaces
- .modules/HashLib/src/KDF
- .modules/HashLib/src/NullDigest
- .modules/HashLib/src/Nullable
- .modules/HashLib/src/Packages
- .modules/HashLib/src/Utils

## Para copiar
```
.modules/horse/src;.modules/jhonson/src;.modules/horse-cors/src;.modules/handle-exception/src;.modules/horse-logger-provider-logfile/src;.modules/horse-logger/src
```

### Para o JWT Delphi
```
.modules/horse-jwt/src;.modules/delphi-jose-jwt/Source/Common;.modules/delphi-jose-jwt/Source/JOSE
```

### Para o JWT Lazarus
```
.modules/horse-jwt/src;.modules/HashLib/src/Base;.modules/HashLib/src/Checksum;.modules/HashLib/src/Crypto;.modules/HashLib/src/Hash128;.modules/HashLib/src/Hash32;.modules/HashLib/src/Hash64;.modules/HashLib/src/Include;.modules/HashLib/src/Interfaces;.modules/HashLib/src/KDF;.modules/HashLib/src/NullDigest;.modules/HashLib/src/Nullable;.modules/HashLib/src/Packages;.modules/HashLib/src/Utils
```
