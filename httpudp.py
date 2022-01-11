
import code
import readline
import rlcompleter

def copen(_globals, _locals):
    context = _globals.copy()
    context.update(_locals)
    readline.set_completer(rlcompleter.Completer(context).complete)
    readline.parse_and_bind("tab: complete")
    shell = code.InteractiveConsole(context)
    shell.interact()
	
from flask import Flask, jsonify, render_template, request
from pyxpudpserver import pyXPUDPServer as XPUDP
from SimConnect import SimConnect
import socket

XPUDP.initialiseUDP(('127.0.0.1',49005),('127.0.0.1',49000),socket.gethostname())
XPUDP.start()

app = Flask(__name__)

def get_dataref(datapoint_name):
	XPUDP.requestXPDref(datapoint_name)
	return XPUDP.getData(datapoint_name)

@app.route('/dataref/<dataref_name>/get', methods=["GET"])
def get_dataref_endpoint(dataref_name):

	ds = request.get_json() if request.is_json else request.form
	output = get_dataref(dataref_name)

	if isinstance(output, bytes):
		output = output.decode('ascii')

	return jsonify(output)

def set_dataref(dataref_name, index=0, value_to_use=0):

	return XPUDP.sendXPDref(dataref_name,index,value_to_use)

@app.route('/dataref/<dataref_name>/set', methods=["GET", "POST"])
def set_dataref_endpoint(dataref_name):

	ds = request.get_json() if request.is_json else request.form
	value_to_use = ds.get('value')
	index = ds.get('index')

	XPUDP.requestXPDref(dataref_name)
	status = set_dataref(dataref_name, index, value_to_use)

	return jsonify(status)

def trigger_command(command_name):

	return XPUDP.sendXPCmd(command_name)

@app.route('/command/<command_name>/trigger', methods=["GET"])
def trigger_command_endpoint(command_name):

	status = trigger_event(command_name)

	return jsonify(status)

app.run(host='0.0.0.0',
port=5500, debug=False)

copen(
globals(),
locals())
