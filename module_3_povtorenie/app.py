# app.py
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

if __name__ == "__main__":
    # слушаем на 0.0.0.0, чтобы порт был доступен снаружи контейнера
    app.run(host="0.0.0.0", port=5000)

