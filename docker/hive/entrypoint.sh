#!/usr/bin/env bash

sudo service ssh start

if [ ! -d "${HIVE_HOME}/initSchema.txt" ]; then
        $HIVE_HOME/bin/schematool --verbose -dbType mysql -initSchema
        echo $(date) >> $HIVE_HOME/initSchema.txt
fi

$HIVE_HOME/bin/hiveserver2