from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route("/echo")
def hello_world():
    msg = request.args.get('msg',' ')
    return jsonify(msg=msg)
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)


