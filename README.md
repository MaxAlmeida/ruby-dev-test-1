# ruby-dev-test-1

Desenvolver a camada de modelos de um sistema de arquivos persistido em um banco de dados SQL onde seja possível criar diretórios e arquivos. Os diretórios poderão conter sub-diretórios e arquivos. O conteúdo dos arquivos podem estar ser persistidos como blob, S3 ou mesmo em disco.

A soluçãos deverá ser escrita majoritariamente em Ruby com framework Ruby on Rails.

Realizar um fork deste repositório.

## Proposed solution
The modeling consists of a tree structure whose model directory references itself and has several files.After the object is created in the database, a directory with the same name and within the parent directory, if any, is created. The directories and subdirectories with your files are created within the storage directory at the root of the project.To simulate the sending of files, the CarrierWave gem was used.

![alt text](https://github.com/MaxAlmeida/ruby-dev-test-1/blob/file_system/modeling.jpg?raw=true)


## How to run the project in local enviroment?
#### 1 - Check if you have everything set up
- MySql is installed
- Rails 5.2.4.4 is installed
- Ruby 2.6.5 is installed
#### 2 - Change DB settings
- Check Database credentials on `config/database.yml` ( add password on development and test for mysql if you have one set )
#### 3 - Run initial commands
- install gems `bundle install` 
- Create Database - `rails db:create`
- Create Tables - `rails db:migrate`
- Feed data to database - `rails db:seed `

After feed database with rails db:seed, the following file and directory structure is expected:


![alt text](https://github.com/MaxAlmeida/ruby-dev-test-1/blob/file_system/folder_seed.jpg?raw=true)
