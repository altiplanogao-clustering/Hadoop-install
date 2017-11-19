#!/bin/bash
THIS_PATH=`dirname $0`
service ssh start

function set_property(){
	local prop=$1
	if [ -n "$prop" ] ; then
			if [[ ${prop:0:1} == '-' ]] ; then
				echo "    Property del: ${prop:1:}"
				python ${THIS_PATH}/conf_editor.py ${HADOOP_CONF_DIR} del ${prop:1:}
			else
				echo "    Property set: ${prop}"
				python ${THIS_PATH}/conf_editor.py ${HADOOP_CONF_DIR} set ${prop}
			fi
	fi
}

function set_properties(){
	local conf_str=$1
	if [ -n "$conf_str" ] ; then
		for conf_item in ${conf_str[*]}
		do
			set_property $conf_item
		done
	fi
}

function set_properties_file(){
	local file=$1
	if [ -f "$file" ] ; then
		echo "Processing configuration file: [$file]"
		while IFS= read -r line
		do
			if [[ ${line:0:1} == '#' ]] ; then
				echo "  $line"
				continue
			elif [[ ! $line =~ [^[:space:]] ]] ; then
				continue
			fi
			set_property $line
		done <"$file"
	fi
}

export NAMENODE_HOSTNAME=${NAMENODE_HOSTNAME:-`hostname -f`}

set_property "core:fs.defaultFS=hdfs://${NAMENODE_HOSTNAME}:9000"
set_property "core:hadoop.tmp.dir=/tmp/hadoop_tmp/"

set_properties $HADOOP_CONF_DATA_PREDEF
set_properties_file "$THIS_PATH/pre_conf.ini"
set_properties_file "$HADOOP_CONF_DATA_PREDEF_FILE"

set_properties $HADOOP_CONF_DATA
set_properties_file "$HADOOP_CONF_DATA_FILE"

echo Parameters: $@
exec $@

