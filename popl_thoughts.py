import subprocess, os
from twitter import *
import yaml

env = os.environ
cwd = os.path.dirname(os.path.realpath(__file__))

def generate_sentence(): 
    return subprocess.Popen("racket -e '(load \"1.2.1.rkt\")'", cwd=cwd, env=env, stdout=subprocess.PIPE, shell=True)

with open("secrets.yaml") as f:
    secrets = yaml.load(f.read())
    t = Twitter(
        auth=OAuth(
            secrets['token'],
            secrets['token-secret'],
            secrets['key'],
            secrets['key-secret']
        )
    )
    with generate_sentence() as p: 
        msg = p.stdout.read().decode('ascii')
        t.statuses.update(status=msg)



