import random
import simpy
RANDOM_SEED = 42
NUM_MACHINES = 2 # Number of machines in the carwash
WASHTIME = 5 # Minutes it takes to clean a car
T_INTER = 7 # Create a car every ~7 minutes
SIM_TIME = 20 # Simulation time in minutes
class Carwash(object):
"""A carwash has a limited number of machines (``NUM_MACHINES``) to
clean cars in parallel.
Cars have to request one of the machines. When they got one, they
can start the washing processes and wait for it to finish (which
takes ``washtime`` minutes).
"""
def __init__(self, env, num_machines, washtime):
self.env = env
self.machine = simpy.Resource(env, num_machines)
self.washtime = washtime
def wash(self, car):
"""The washing processes. It takes a ``car`` processes and tries
to clean it."""
yield self.env.timeout(WASHTIME)
print("Carwash removed %d%% of %s's dirt." %
(random.randint(50, 99), car))
def car(env, name, cw):
"""The car process (each car has a ``name``) arrives at the carwash
(``cw``) and requests a cleaning machine.
It then starts the washing process, waits for it to finish and
leaves to never come back ...
"""
print('%s arrives at the carwash at %.2f.' % (name, env.now))
with cw.machine.request() as request:
yield request
print('%s enters the carwash at %.2f.' % (name, env.now))
yield env.process(cw.wash(name))
print('%s leaves the carwash at %.2f.' % (name, env.now))
def setup(env, num_machines, washtime, t_inter):