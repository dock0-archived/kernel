#!/usr/bin/env python

import roller
import argparse
import os.path
import sys

def get_args(raw_args):
    parser = argparse.ArgumentParser(
        description='Build the kernel from the config'
    )
    parser.add_argument(
        'config_file',
        help='Config file to work from',
    )
    return parser.parse_args(raw_args)


def get_version(config):
    with open(config) as handle:
        for line in handle:
            if 'Kernel Configuration' in line:
                version = line.split(' ')[2]
                break
    version = version.replace('.0-rc', '-rc')
    if version.endswith('.0'):
        version = version[0:-2]
    return version


def easy_version(raw_args):
    args = get_args(raw_args)

    print(get_version(args.config_file))

if __name__ == '__main__':
    easy_version(sys.argv[1:])
