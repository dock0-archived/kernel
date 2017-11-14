#!/usr/bin/env python

import roller
import argparse
import os.path
import sys
import version

def get_args(raw_args):
    parser = argparse.ArgumentParser(
        description='Build the kernel from the config'
    )
    parser.add_argument(
        'config_file',
        help='Config file to work from',
    )
    parser.add_argument(
        '-b', '--build-dir',
        dest='build_dir',
        default='/tmp',
        help='directory for downloading, extracting, and building the kernel'
    )
    parser.add_argument(
        '-r', '--revision',
        dest='revision',
        default='dev',
        help='Set revision for new kernel'
    )
    return parser.parse_args(raw_args)

def easy_build(raw_args):
    args = get_args(raw_args)

    config_file = os.path.abspath(args.config_file)
    
    kernel = roller.Kernel(
        build_dir=args.build_dir,
        verbose=True
    )

    kernel.version = version.get_version(config_file)
    kernel.revision = args.revision
    kernel.config = config_file
    kernel.output = 'none'

    kernel.download()
    kernel.extract()
    kernel.configure()
    kernel.make()
    kernel.where()

if __name__ == '__main__':
    easy_build(sys.argv[1:])
