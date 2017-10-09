#!/bin/bash

swagger-commander set-swagger-url "${URL}" >&2

swagger-commander "$@"
