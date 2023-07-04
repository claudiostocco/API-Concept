# Adicionar Horse a um projeto Delphi/Lazarus

Criar pasta [.mudules], nesta pasta executar [git clone] para as dependências e adicionar o caminho no classpath do projeto.

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

- .mudules/horse/src
- .mudules/jhonson/src
- .mudules/horse-cors/src
- .mudules/handle-exception/src
- .mudules/horse-logger-provider-logfile/src
- .mudules/horse-logger/src

### Para o JWT Delphi

- .mudules/horse-jwt/src
- .mudules/delphi-jose-jwt/Source/Common
- .mudules/delphi-jose-jwt/Source/JOSE

### Para o JWT Lazarus

- .mudules/horse-jwt/src
- .mudules/HashLib/src/Base
- .mudules/HashLib/src/Checksum
- .mudules/HashLib/src/Crypto
- .mudules/HashLib/src/Hash128
- .mudules/HashLib/src/Hash32
- .mudules/HashLib/src/Hash64
- .mudules/HashLib/src/Include
- .mudules/HashLib/src/Interfaces
- .mudules/HashLib/src/KDF
- .mudules/HashLib/src/NullDigest
- .mudules/HashLib/src/Nullable
- .mudules/HashLib/src/Packages
- .mudules/HashLib/src/Utils

## Para copiar
```
.mudules/horse/src;.mudules/jhonson/src;.mudules/horse-cors/src;.mudules/handle-exception/src;.mudules/horse-logger-provider-logfile/src;.mudules/horse-logger/src
```

### Para o JWT Delphi
```
.mudules/horse-jwt/src;.mudules/delphi-jose-jwt/Source/Common;.mudules/delphi-jose-jwt/Source/JOSE
```

### Para o JWT Lazarus
```
.mudules/horse-jwt/src;.mudules/HashLib/src/Base;.mudules/HashLib/src/Checksum;.mudules/HashLib/src/Crypto;.mudules/HashLib/src/Hash128;.mudules/HashLib/src/Hash32;.mudules/HashLib/src/Hash64;.mudules/HashLib/src/Include;.mudules/HashLib/src/Interfaces;.mudules/HashLib/src/KDF;.mudules/HashLib/src/NullDigest;.mudules/HashLib/src/Nullable;.mudules/HashLib/src/Packages;.mudules/HashLib/src/Utils
```
