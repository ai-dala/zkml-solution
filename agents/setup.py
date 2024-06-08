# setup.py
from setuptools import setup, find_packages
import os


def parse_requirements(filename):
    with open(filename, "r") as f:
        return [line.strip() for line in f if line.strip() and not line.startswith("#")]


setup(
    name="aidala_agent",
    version="0.1",
    py_modules=["aidala_agent"],
    install_requires=parse_requirements("requirements.txt"),
    entry_points={
        "console_scripts": [
            "aidala_agent = aidala_agent:run_agents",
        ],
    }
)
