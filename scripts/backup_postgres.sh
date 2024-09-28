#! /bin/bash

PGPASSWORD="postgres" pg_dump -U postgres doccano > $HOME/backups/doccano.sql
