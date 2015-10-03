# Unknown_Installer
Program written in Delphi to create installers. || Programa escrito em Delphi para criar instaladores.



        Desenvolvido por Maickonn Richard.
        Contato: senjaxus@gmail.com
        
        Use e abuse destas fontes para estudos.



------------------------------------------------------------------------

O Unknown Installer é um Software escrito em Delphi XE6, na qual seu objetivo é criar instaladores de forma rápida.

O Software, possui opções simples, como Escolher .exe principal, escolher o diretório, abrir algum arquivo após a instalação, versão etc.

------------------------------------------------------------------------


#O software não utiliza nenhum componente de terceiros, ou seja, todos os componentes usados são nativos do Delphi!


<strong>Como funciona?</strong>

Os softwares ao serem compilados, vão para a pasta Bin, lá haverá 2 .exe, um é o Stub.exe e o outro é o Unknown_Installer.exe.
Na pasta Bin, você encontrará também os arquivos:
* Arquivo.rc (Possui o local da Stub.exe).
* Arquivo.RES (É o recurso do Stub.exe que será embutido no Unknown_Installer.exe após ser compilado no Delphi).
* Criar Recurso.bat (Arquivo .bat para criar um recurso do Stub.exe).


O Unknown_Installer.exe é o software que irá modificar o Stub.exe, inserindo em sua Resource, um roteiro informando quais pastas deverão ser criadas e onde serão extraídos cada arquivo, e as informações básicas, como Nome do Programa, Versão, Site etc.
Ao finalizar, ele irá renomear a Stub para o nome escolhido como Instalador.


O Stub.exe, é o cabeçalho, ou seja, ele será o instalador final.

Ao abrir o instalador (Que na verdade é a Stub modificada pelo Unknown_Installer.exe), ela irá extrair o roteiro e as informações básicas para a pasta temporária, irá carregar na memória e mostrar as informações para o usuário, como Nome do Programa, local de instalação etc.
Quando o usuário clicar em instalar, o Stub vai ler o roteiro, extraindo os arquivos e os descomprimindo.

